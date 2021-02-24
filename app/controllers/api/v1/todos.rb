module API 
    module V1
        class Todos < Grape::API
            include API::V1::Defaults

            resource :todos do
                desc "All Available Todos"
                get "" do 
                    Todo.all
                end

                desc "Return a Todo"
                    params do 
                        requires :id, type: String, desc: "ID the TODO"
                    end
                    get ":id" do
                        Todo.where(id: permitted_params[:id]).first!
                    end
                end
        end
    end    
end
