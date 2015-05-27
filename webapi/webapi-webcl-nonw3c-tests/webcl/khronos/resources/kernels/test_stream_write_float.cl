__kernel void test_stream_write_float(
    __global float *src,
    __global float *dst)
{
    int  tid = get_global_id(0);
    dst[tid] = src[tid];
}
