module API 
    module V1
        class Todos < Grape::API
            include API::V1::Defaults

            

            resource :todos do

                #Made route to get all 
                desc "All Available Todos"
                    get "" do 
                        Todo.all
                    end

                #Route to destory all completed (would never actually do this and instead keep the data, and make "show or not show") 
                desc "All Available Todos"
                    delete "remove_complete" do 
                        Todo.where("completed").destroy_all
                    end

                #Post Route to create todo   
                desc "create a Todo"
                    params do
                        requires :title, type: String, desc: 'Create a todo'
                    end
                    post do 
                        Todo.create!({
                            title: params[:title],
                            session_id: params[:session_id],
                            user: params[:user]
                        })
                    end
                
                #Update user with param
                desc "Update User"
                    params do
                        requires :id
                    end
                    put ':id' do
                        current_todo = Todo.find_by_id(params[:id])
                        #If not found the api will respond with:
                        return "Todo Not Found" unless current_todo
                        return "No Change Made" unless params[:user]
                        current_todo.user = params[:user]
                        current_todo.save!
                    end

                #Update route to flip completion
                desc "Flip Todo Creation"
                    params do
                        requires :id
                    end
                    put ':id/flip' do
                        current_todo = Todo.find_by_id(params[:id])
                        #If not found the api will respond with:
                        return "Todo Not Found" unless current_todo
                        current_todo.completed = !current_todo.completed
                        current_todo.save!
                    end

                # return Single Todo
                desc "Return a Todo"
                    params do 
                        requires :id, type: String, desc: "ID the TODO"
                    end
                    get ":id" do
                        Todo.where(id: permitted_params[:id]).first!
                    end

                # Destroy single todo ( I would not actually destroy in real world, just hide or give an "are you sure")
                desc "Remove Todo"
                    params do 
                        requires :id
                    end
                    delete ":id" do 
                        Todo.find_by_id(params[:id]).destroy!
                    end
                    
            end
        end
    end    
end
