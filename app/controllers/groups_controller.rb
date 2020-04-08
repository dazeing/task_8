class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
    end

    def new
        @group = Group.new
    end

    def create
        Group.transaction do
            @group = Group.create!(group_params)
        end

        if @group.save
            redirect_to group_path(@group)
        else
           render :new
        end
    end

    def destroy
        @group = Group.find(params[:id])
        Group.transaction do
            if @group.destroy!
                redirect_to groups_path
            else
                render :show
            end
        end
    end
    
    private 
        def group_params
            params.require(:group).permit(:name)
        end
end
