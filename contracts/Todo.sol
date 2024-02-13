// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Todo {
    struct Todos {
        string title;
        string description;
        bool isdone;
    }

    Todos [] todolist;

    function createTodo (string memory _title, string memory _description) public {
        todolist.push(Todos(_title, _description, false ));
    }

    function updateTitle (string memory _title, uint i) public {
        todolist[i].title = _title;
    }
    function updateDescription (string memory _description, uint i) public {
        todolist[i].description = _description;
    }
    function isDoneToggle (uint i) public{
        if (todolist[i].isdone == false ){
            todolist[i].isdone = true;
        }
        else if (todolist[i].isdone == true){
            todolist[i].isdone == false;
        }
    }

    function deleteTodo (uint id) public {
        for(uint i=0; i<todolist.length; i++){
            todolist[id] = todolist[id+i];
        }
        todolist.pop();
    }

    function getTodo (uint i) public view returns (string memory, string memory, bool){
        return (todolist[i].title, todolist[i].description, todolist[i].isdone);
    }
}