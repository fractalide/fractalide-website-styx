{
}:

{
  stakepool.xtz = {
    data = builtins.fromJSON (builtins.readFile ./staker_data.json);
    address = "tz1P6kxtzRrJ8KfXE4kKqR1RBiSpEgimxN5o";
  };
}
