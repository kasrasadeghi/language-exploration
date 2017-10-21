
actor Main
  new create(env: Env) =>
    let a = "1,,2".split(",")
    for i in (consume a).values() do
      env.out.print(i)
    end
