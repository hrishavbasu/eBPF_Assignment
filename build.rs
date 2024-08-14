use libbpf_cargo::SkeletonBuilder;
use std::path::PathBuf;

const SRC: &str = "src/bpf/bpf_program.bpf.c";

fn main() {
    let skel = PathBuf::from("src/bpf/bpf.rs");
    SkeletonBuilder::new()
        .source(SRC)
        .build_and_generate(&skel)
        .expect("Failed to build and generate skeleton");
    println!("cargo:rerun-if-changed={}", SRC);
}