import {
    loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Todo", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployTodo() {
    const Todo = await ethers.getContractFactory("Todo");
    const todo = await Todo.deploy();

    return { todo };
  }

  describe("Todolist", function () {
      it("it should update title", async function () {
        const { todo } = await loadFixture(deployTodo);

        const title = await todo.updateTitle ("Cook", 0);
        const description = await todo.updateDescription ("I need to cook", 0);

        await expect(todo.getTodo(0)).to.equal("Cook", "I need to cook");
       
      });
    })