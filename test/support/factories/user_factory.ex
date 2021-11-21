defmodule News.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %News.Accounts.User{
          name: "Luiz",
          password: "123456",
          email: sequence(:email, &"gandalf#{&1}@istari.com")
        }
      end
    end
  end
end
