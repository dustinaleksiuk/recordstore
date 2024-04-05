# Record Store

This is a simple example application that shows a way to add and remove the "many" records of a one-to-many relationship on a LiveView form with a single save action. It holds the changes in the LiveView state until the Save button is clicked. This repo was originally a spike I created to learn how to do this and now accompanies [this writeup](https://dustinaleksiuk.github.io/liveview/2021/12/05/nested-parent-child-form-phoenix-liveview.html).

To run the example project:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start the Phoenix server with `mix phx.server` or inside IEx with `iex -S mix phx.server`

You can now open [`localhost:4000`](http://localhost:4000) from your browser.
