require 'rails_helper'

describe 'new post' do 
    it 'ensures that the form route works with the /new action' do
        visit new_post_path
        expect(page.status_code).to eq(200)
    end

    it 'renders HTML in the /new template' do
        visit new_post_path
        expect(page).to have_content('Post Form')
    end

    it :"displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
        visit new_post_path
        fill_in 'post_title', with: "Arzy is Amazing"
        fill_in 'post_description', with: "Arzy is the most amazing dude ever. He has so much dedication, not really. He wants to balance everything out. A jack of all trades is a master of none... but most of the time... it is..."
        
        click_on 'Submit Post'

        expect(page.current_path).to eq(posts_path)
        expect(page).to have_content('Arzy is Amazing')
        expect(page).to have_content('Arzy is the most amazing dude ever. He has so much dedication, not really. He wants to balance everything out. A jack of all trades is a master of none... but most of the time... it is...')
    end
end