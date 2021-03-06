require 'rails_helper'

RSpec.describe SearchHis do
  describe '#rename_user_history' do
    it 'rename tmp_user_id to new user_id' do
      create(:search_his, user_id: 1_234_567)
      create(:search_his, user_id: 1_234_567)
      new_user = create(:user)
      SearchHis.rename_user_history(1_234_567, new_user.id)
      expect(SearchHis.where(user_id: new_user.id).size).to eq(2)
    end
  end
end
