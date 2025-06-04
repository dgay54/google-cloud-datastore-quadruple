
  static clz64(x: bigint): number {
    let high = Number(x >> 32n);
    return high == 0 ? 32 + Math.clz32(Number(BigInt.asUintN(32, x))) : Math.clz32(high);
  }
}
