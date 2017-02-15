# SomeEcto

Example of Ecto error on preloading belongs_to associations for embedded schemas:

```
  1) test preload for embed changeset with valid attributes (SomeEctoTest)
     test/some_ecto_test.exs:17
     ** (MatchError) no match of right hand side value: %SomeEcto.Patterson{age: nil, first_name: "some content", id: "a337aa63-b9ef-4e3b-ac8d-c5166767259f", last_name: "some content", party: #Ecto.A
ssociation.NotLoaded<association :party is not loaded>, party_id: 33}
     stacktrace:
       test/some_ecto_test.exs:27: (test)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `some_ecto` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:some_ecto, "~> 0.1.0"}]
    end
    ```

  2. Ensure `someEcto` is started before your application:

    ```elixir
    def application do
      [applications: [:some_ecto]]
    end
    ```
