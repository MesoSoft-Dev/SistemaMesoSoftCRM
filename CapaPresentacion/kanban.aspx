<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kanban.aspx.cs" Inherits="CapaPresentacion.kanban" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="Assets/css/Kstyle.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="modal fade" id="todo_form" tabindex="-1" aria-labelledby="todoModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="todoModalLabel">Agregar tarea</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="text" id="todo_input" class="form-control mb-2" />
            <button class="btn btn-success btn-block" id="todo_submit">Agregar tarea</button>
          </div>
        </div>
      </div>
    </div>

    <div class="container mt-5 ">
      <div class="row mx-auto"> 
        <div class="col-md status border shadow mb-3 me-3" id="no_status">
          <h2 class="">No iniciado</h2>
          <button id="add_btn" class="btn w-100 btn-agregar mt-auto " data-bs-toggle="modal" data-bs-target="#todo_form">
            + Agregar
          </button>
        </div>
        <div class="col-md border shadow status  mb-3 me-3">
          <h2>En progreso</h2>
        </div>
        <div class="col-md border shadow status mb-3 me-3">
          <h2>Completado</h2>
        </div>
        <div class="col-md border shadow status mb-3 me-3">
          <h2>Cancelado</h2>
        </div>
        <div class="col-md border shadow status mb-3 me-3">
          <h2>En espera</h2>
        </div>
      </div>
    </div>

    <div id="overlay" class="d-none"></div>

<script src="Assets/js/Kscript.js"></script>
   
  
 

</asp:Content>
