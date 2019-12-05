Rails.application.routes.draw do
  # Routes for the Category resource:

  match("/", { :controller => "groups", :action => "index", :via => "get" })
  
  # CREATE
  get("/categories/new", { :controller => "categories", :action => "new_form" })
  post("/create_category", { :controller => "categories", :action => "create_row" })

  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  get("/categories/:id_to_display", { :controller => "categories", :action => "show" })

  # UPDATE
  get("/categories/:prefill_with_id/edit", { :controller => "categories", :action => "edit_form" })
  post("/update_category/:id_to_modify", { :controller => "categories", :action => "update_row" })

  # DELETE
  get("/delete_category/:id_to_remove", { :controller => "categories", :action => "destroy_row" })

  #------------------------------

  # Routes for the Group resource:

  # CREATE
  get("/groups/new", { :controller => "groups", :action => "new_form" })
  post("/create_group", { :controller => "groups", :action => "create_row" })

  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  get("/groups/:id_to_display", { :controller => "groups", :action => "show" })

  # UPDATE
  get("/groups/:prefill_with_id/edit", { :controller => "groups", :action => "edit_form" })
  post("/update_group/:id_to_modify", { :controller => "groups", :action => "update_row" })

  # DELETE
  get("/delete_group/:id_to_remove", { :controller => "groups", :action => "destroy_row" })

  #------------------------------

  # Routes for the Expense resource:

  # CREATE
  get("/expenses/new", { :controller => "expenses", :action => "new_form" })
  post("/create_expense", { :controller => "expenses", :action => "create_row" })
  post("/create_expense_from_category", { :controller => "expenses", :action => "create_row_from_category" })
  post("/create_expense_from_group", { :controller => "expenses", :action => "create_row_from_group" })

  # READ
  get("/expenses", { :controller => "expenses", :action => "index" })
  get("/expenses/:id_to_display", { :controller => "expenses", :action => "show" })

  # UPDATE
  get("/expenses/:prefill_with_id/edit", { :controller => "expenses", :action => "edit_form" })
  post("/update_expense/:id_to_modify", { :controller => "expenses", :action => "update_row" })

  # DELETE
  get("/delete_expense/:id_to_remove", { :controller => "expenses", :action => "destroy_row" })
  get("/delete_expense_from_category/:id_to_remove", { :controller => "expenses", :action => "destroy_row_from_category" })
  get("/delete_expense_from_group/:id_to_remove", { :controller => "expenses", :action => "destroy_row_from_group" })

  #------------------------------

  # Routes for the Individual expense ledger resource:

  # CREATE
  get("/individual_expense_ledgers/new", { :controller => "individual_expense_ledgers", :action => "new_form" })
  post("/create_individual_expense_ledger", { :controller => "individual_expense_ledgers", :action => "create_row" })
  post("/create_individual_expense_ledger_from_expense", { :controller => "individual_expense_ledgers", :action => "create_row_from_expense" })

  # READ
  get("/individual_expense_ledgers", { :controller => "individual_expense_ledgers", :action => "index" })
  get("/individual_expense_ledgers/:id_to_display", { :controller => "individual_expense_ledgers", :action => "show" })

  # UPDATE
  get("/individual_expense_ledgers/:prefill_with_id/edit", { :controller => "individual_expense_ledgers", :action => "edit_form" })
  post("/update_individual_expense_ledger/:id_to_modify", { :controller => "individual_expense_ledgers", :action => "update_row" })

  # DELETE
  get("/delete_individual_expense_ledger/:id_to_remove", { :controller => "individual_expense_ledgers", :action => "destroy_row" })
  get("/delete_individual_expense_ledger_from_expense/:id_to_remove", { :controller => "individual_expense_ledgers", :action => "destroy_row_from_expense" })
  get("/delete_individual_expense_ledger_from_user/:id_to_remove", { :controller => "individual_expense_ledgers", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
