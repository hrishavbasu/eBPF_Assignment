use anyhow::Result;

mod bpf;
use bpf::*;

fn main() -> Result<()> {
    let mut skel_builder = BpfProgramSkelBuilder::default();
    let mut skel = skel_builder.open()?.load()?;
    skel.attach()?;

    println!("eBPF program loaded and attached");

    loop {
        std::thread::sleep(std::time::Duration::from_secs(1));
    }
}