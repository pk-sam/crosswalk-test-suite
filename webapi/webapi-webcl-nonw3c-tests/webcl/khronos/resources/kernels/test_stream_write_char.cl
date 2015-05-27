__kernel void test_stream_write_char(
    __global char *src,
    __global char *dst)
{
    int  tid = get_global_id(0);
    dst[tid] = src[tid];
}
