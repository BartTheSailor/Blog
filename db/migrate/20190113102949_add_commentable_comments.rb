class AddCommentableComments < ActiveRecord::Migration[5.2]
  def change
    #usuwamyograniczenie klucza obcego article_id w tabeli comments
    # dzięki temu po zmianie nazwy kolumna ta będzie mogła odnościc sie do czegos innego niz artykuly
    remove_foreign_key :comments, :articles

    # od teraz article_id dniech nazywa sie commentable_id

    rename_column :comments, :article_id, :commentable_id
    
    # reszta komentarzy w oryginale na github
    add_column :comments, :commentable_type, :string, null: false, default: 'Article'
  
    add_index :comments, [:commentable_type, :commentable_id]


  end
end
