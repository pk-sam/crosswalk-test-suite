__kernel void test_stream_write_ushort(
    __global ushort *src,
    __global ushort *dst)
{
    int  tid = get_global_id(0);
    dst[tid] = src[tid];
}
