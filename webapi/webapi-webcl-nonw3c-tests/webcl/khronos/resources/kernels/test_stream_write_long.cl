__kernel void test_stream_write_long(
    __global long *src,
    __global long *dst)
{
    int  tid = get_global_id(0);
    dst[tid] = src[tid];
}
