defmodule Offbook.AdminTest do
  use Offbook.DataCase

  alias Offbook.Admin

  describe "departments" do
    alias Offbook.Admin.Department

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def department_fixture(attrs \\ %{}) do
      {:ok, department} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_department()

      department
    end

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Admin.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Admin.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      assert {:ok, %Department{} = department} = Admin.create_department(@valid_attrs)
      assert department.description == "some description"
      assert department.name == "some name"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      assert {:ok, %Department{} = department} = Admin.update_department(department, @update_attrs)
      assert department.description == "some updated description"
      assert department.name == "some updated name"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_department(department, @invalid_attrs)
      assert department == Admin.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Admin.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Admin.change_department(department)
    end
  end
end
