json = require "json"

math.randomseed( os.time() )

protein = {"Chicken breast", "Turkey", "Egg", "Salmon", "Lean Steak", "Shrimp", "Tofu", "Cheese", "Yogurt", "Kefir", "Tuna"}
veggies = {"Broccoli", "Zucchini", "Squash", "Peppers", "Sparagus", "Salad", "Carrots", "Tomatoes"}
carbo = {"WRice", "BRice", "Sweat Potatoes", "Plain potatoes", "Oatmeal", "Quinoa", "Grains", "CousCous"}

menu_plan = {}

function PrintDay(num_days)
  
  for day = 1, num_days do
    
    local meals = {}
    
    local lunch = {}
    local dinner = {}
    
    local prote, veggie, carb
    
    print("Día " .. day)
    print("---------------------------")
    print("Comida")
    print("--------------")
    prote = protein[math.random(#protein)]
    print(prote)
    
    veggie = veggies[math.random(#veggies)]
    print(veggie)
    
    carb = carbo[math.random(#carbo)]
    print(carb)
    
    lunch["protein"] = prote
    lunch["veggie"] = veggie
    lunch["carbo"] = carb
    print("")
    
    print("Cena")
    print("--------------")
    prote = protein[math.random(#protein)]
    print(prote)
    
    veggie = veggies[math.random(#veggies)]
    print(veggie)
    
    carb = carbo[math.random(#carbo)]
    print(carb)
    
    dinner["protein"] = prote
    dinner["veggie"] = veggie
    dinner["carbo"] = carb
    print("")
    
    table.insert(meals, lunch)
    table.insert(meals, dinner)
    
    menu_plan[day] = meals
  end

  AskSave()
  
end

function AskSave()
  print("Quieres guardar este menú G (Guardar) / P ?")
  end

function Welcome()
  print("")
  print("Hola y bienvenid@ a AutoMeal :) \n")
  end

function MainMenu()
  print("Selecciona una opción, escribiendo su numero y pulsando Intro:")
  print("1 Menú una semana")
  print("2 Menú de 1 día")
  print("3 Menú de N días")
  print("4 Ver listas de alimentos")
  print("E. Exit")
  print("")
end

function Week()
  PrintDay(7)
  end

function Day()
  PrintDay(1)
  end

function NDay()
  
  print("Cuantos días quieres?")
  io.flush()
  days = io.read()
  
  PrintDay(days)
end

function Foods()
  
  print("Protein")
  print("--------------")
  print(table.concat(protein,", "))
  print("")
  print("Veggies")
  print("--------------")
  print(table.concat(veggies,", "))
  print("")
  print("Carbo")
  print("--------------")
  print(table.concat(carbo,", "))
  print("")
  
  MainMenu()
end

function SaveMenu()
  
  name = "test" .. ".txt"
  path = "D:/Carla/" .. name
  file = io.open(path, "w")
  local fil = json.encode(menu_plan)
  file:write(fil)
  file:close()
  
  print("↓↓↓↓↓")
  print("Archivo guardado en " .. path)
  print("↑↑↑↑↑")
  print("")
  
  MainMenu()
  
end

function Main()
  
  Welcome()
  
  MainMenu()
  
  repeat
    io.flush()
    option = io.read()
    os.execute("cls")
    
    if option == "1" then
      Week()
    end
  
    if option == "2" then
      Day()
    end
    
    if option == "3" then
      NDay()
    end
    
    if option == "4" then
      Foods()
    end
    
    if option == "p" or option == "P" then
      MainMenu()
    end
    
    if option == "g" or option == "G" then
      SaveMenu()
    end
        
  until(option == "e" or option == "E")

end

Main()