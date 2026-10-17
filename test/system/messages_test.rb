require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test "posta um recado direto do mural" do
    visit root_path

    fill_in "Seu nome", with: "Carla"
    fill_in "Recado", with: "Postei direto do mural!"
    select "Verde", from: "Cor"
    click_on "Postar recado"

    assert_text "Postei direto do mural!"
    assert_selector ".card-green", text: "Carla"
  end

  test "mostra os avisos de um recado vazio" do
    visit root_path
    click_on "Postar recado"

    assert_text "Escreva o seu nome."
    assert_text "Escreva o seu recado."
  end

  test "corrige um recado" do
    visit root_path
    within(".card", text: "Bia") { click_on "Editar" }
    assert_selector "h1", text: "Corrigir recado"

    fill_in "Recado", with: "Adorei muito o workshop!"
    click_on "Salvar"

    assert_text "Adorei muito o workshop!"
  end

  test "filtra os recados por cor" do
    visit root_path
    click_on "Rosa"

    assert_text "Adorei o workshop!"
    assert_no_text "Meu primeiro recado!"
  end

  test "curte um recado" do
    visit root_path
    within(".card", text: "Ana") { click_on "❤️ 0" }

    within(".card", text: "Ana") { assert_button "❤️ 1" }
  end

  test "apaga um recado" do
    visit root_path
    accept_confirm("Quer mesmo apagar este recado?") do
      within(".card", text: "Ana") { click_on "Apagar" }
    end

    assert_no_text "Meu primeiro recado!"
  end
end
