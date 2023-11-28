#include "fft.h"

idx_type idx_reverse(idx_type idx_in)
{
#pragma HLS INLINE
    idx_type idx_out;
    for (int i = 0; i < S;i++)
    {
#pragma HLS UNROLL
        idx_out[S - 1 - i] = idx_in[i];
    }
    return idx_out;
}

void bit_reverse(cplx x_in[N],cplx x_out[N])
{
    for (int i = 0; i < N;i++)
    {
        idx_type idx = (idx_type)(i);
        idx_type idx_r = idx_reverse(idx);
#ifndef __SYNTHESIS__
        printf("%d, %d\n",(int)idx, (int)idx_r);
#endif
        x_out[idx_r] = x_in[idx];
    }
}

void butterfly(cplx& y_l, cplx& y_h,cplx x_l, cplx x_h, dtype wr, dtype wi)
{
#pragma HLS INLINE
    dtype r_temp = wr * x_h.real - x_h.imag * wi;
#pragma HLS BIND_OP variable=r_temp op=fmul impl=meddsp
    dtype i_temp = wr * x_h.imag + x_h.real * wi;
#pragma HLS BIND_OP variable=i_temp op=fmul impl=meddsp
    y_l.real = x_l.real + r_temp;
    y_l.imag = x_l.imag + i_temp;
    y_h.real = x_l.real - r_temp;
    y_h.imag = x_l.imag - i_temp;
}

void fft_stage(cplx x_in[N], cplx x_out[N], int stage)
{
    int butters_per_block = 1 << (stage - 1);
    int points_per_block = 1 << (stage);
    int blocks = 1 << (S - stage);
#ifndef __SYNTHESIS__
    printf("Stage %d, blocks = %d, butters per block = %d, points per block = %d\n",stage,blocks,butters_per_block,points_per_block);
#endif
    for (int j = 0; j < butters_per_block;j++)
    {
        idx_type k = j * blocks;
        dtype wr = W_real[k];
        dtype wi = W_imag[k];
        for (int i = 0; i < blocks;i++)
        {
#pragma HLS pipeline
            idx_type idx = points_per_block * i + j;
#ifndef __SYNTHESIS__
            printf("butter %d,%d\n",(int(idx)), int(idx+butters_per_block));
#endif
            butterfly(x_out[idx],x_out[idx + butters_per_block],x_in[idx],x_in[idx + butters_per_block], wr, wi);
        }
    }
}

void FFT(cplx_stream& x_in, cplx_stream& y_out)
{
#pragma HLS INTERFACE mode=axis register_mode=both depth=N port=y_out register
#pragma HLS INTERFACE mode=axis register_mode=both depth=N port=x_in register
#pragma HLS INTERFACE s_axilite port=return  bundle=CONTROL

#pragma HLS DATAFLOW
    cplx x_local[N];
    cplx x_local_s[S+1][N];
#pragma HLS ARRAY_PARTITION dim=1 variable=x_local_s type=complete

    for (int i = 0; i < N; i++)
    {
        cplx_dp temp;
        x_in >> temp;
        x_local[i].real = temp.data.real;
        x_local[i].imag = temp.data.imag;
    }

    bit_reverse(x_local, x_local_s[0]);
#ifndef __SYNTHESIS__
    for (int i = 0; i < N;i++)
    {
    	printf("%f, %f\n",x_local[i].real,x_local_s[0][i].real);
    }
#endif
    for (int i = 1; i <= S; i++)
    {
#pragma HLS UNROLL
    	fft_stage(x_local_s[i-1],x_local_s[i],i);
    }

    for (int i = 0; i < N; i++)
    {
        cplx_dp temp;
        temp.data.real = x_local_s[S][i].real;
        temp.data.imag = x_local_s[S][i].imag;
        temp.keep = -1;
        temp.last = (i == (N - 1));
        y_out << temp;
    }
}
