require 'test_helper'

class ApiV1::MeasuresControllerTest < ActionController::TestCase
  include Devise::TestHelpers
      
  setup do
    @error_dir = File.join('log','load_errors')
    FileUtils.rm_r @error_dir if File.directory?(@error_dir)
    dump_database
    collection_fixtures("draft_measures", "records", "users")
    @user = User.by_email('bonnie@example.com').first
    associate_user_with_measures(@user,Measure.all)
    associate_user_with_patients(@user,Record.all)
    associate_measures_with_patients(Measure.all, Record.all)
    @num_patients = Record.all.size
    @measure = Measure.where({"cms_id" => "CMS128v2"}).first
    @api_v1_measure = @measure.measure_json[:id]
    sign_in @user
  end

  test "should get index as html" do
    get :index
    assert_response :success
    assert_equal response.content_type, 'text/html'
    assert_not_nil assigns(:api_v1_measures)
  end

  test "should get index as json" do
    get :index, :format => "json"
    assert_response :success
    assert_equal response.content_type, 'application/json'
    json = JSON.parse(response.body)
    assert_equal 3, json.size
    assert_equal ['CMS104v2','CMS128v2','CMS138v2'], json.map{|x|x['cms_id']}
    assert_not_nil assigns(:api_v1_measures)
  end

  test "should show api_v1_measure" do
    get :show, id: @api_v1_measure
    assert_response :success
    assert_equal response.content_type, 'application/json'
    json = JSON.parse(response.body)
    assert_equal 'CMS128v2', json['cms_id']
    assert_not_nil assigns(:api_v1_measure)
  end

  test "should not show unknown measure" do
    get :show, id: 'foo'
    assert_response :missing
  end

  test "should show patients for api_v1_measure" do
    get :patients, id: @api_v1_measure
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal @num_patients, json.size
    assert_equal ['A','B','C','D'], json.map{|x|x["last"]}
  end

  test "should not show patients for unknown measure" do
    get :patients, id: 'foo'
    assert_response :missing
  end

  test "should evaluate api_v1_measure" do
    get :evaluate, id: @api_v1_measure
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal @num_patients, json.size
  end

  test "should not evaluate unknown measure" do
    get :evaluate, id: 'foo'
    assert_response :missing
  end

  test "should create api_v1_measure" do
    skip
  end

  test "should update api_v1_measure" do
    skip
  end

end