defmodule Inmana.Core.Command do
  defmacro __using__(_) do
    quote do
      import Ecto.Query
      alias Inmana.Repo

      @msg_error_not_found "Not found!"
      @msg_error_uuid "ID is invalid!"

      def handle_response(nil) do
        handle_error(@msg_error_not_found, :not_found)
      end

      def handle_response(result) do
        {:ok, result}
      end

      def handle_error_uuid_invalid do
        handle_error(@msg_error_uuid, :bad_request)
      end

      def handle_error(msg, status) when is_atom(status) do
        {:error, %{result: msg, status: status}}
      end

      def get_by_id(schema, uuid) do
        case Ecto.UUID.cast(uuid) do
          {:ok, uuid} -> Repo.get(schema, uuid) |> handle_response()
          :error -> handle_error("UUID is invalid!", :bad_request)
        end
      end
    end
  end
end
