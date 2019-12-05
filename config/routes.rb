Rails.application.routes.draw do
  # Routes for the Individual expense ledger resource:

  # CREATE
  get("/individual_expense_ledgers/new", { :controller => "individual_expense_ledgers", :action => "new_form" })
  post("/create_individual_expense_ledger", { :controller => "individual_expense_ledgers", :action => "create_row" })

  # READ
  get("/individual_expense_ledgers", { :controller => "individual_expense_ledgers", :action => "index" })
  get("/individual_expense_ledgers/:id_to_display", { :controller => "individual_expense_ledgers", :action => "show" })

  # UPDATE
  get("/individual_expense_ledgers/:prefill_with_id/edit", { :controller => "individual_expense_ledgers", :action => "edit_form" })
  post("/update_individual_expense_ledger/:id_to_modify", { :controller => "individual_expense_ledgers", :action => "update_row" })

  # DELETE
  get("/delete_individual_expense_ledger/:id_to_remove", { :controller => "individual_expense_ledgers", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
