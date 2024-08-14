#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

char LICENSE[] SEC("license") = "Dual BSD/GPL";

SEC("tracepoint/syscalls/sys_enter_write")
int bpf_prog(void *ctx)
{
    // Your eBPF program logic will go here
    return 0;
}