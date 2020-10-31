//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Artem Bazhanov on 31.10.2020.
//

import UIKit

class ViewController: UIViewController {
    //Вступление: при раскидывании объектов на сториборде, мы текстовым полям явно сказали, что при вводе значений, показывать клавиутру Phone Number
    
    
    
    //Соединяем текстовые Label с кодом приложения. Т.е. мы теперь можем обратится к этим текстовым объектам в storyboard из кода по значениям: dateTF, monthTF, yearTF, resultLabel
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
       
    
    @IBAction func findDate(_ sender: UIButton) { //А вот здесь мы не просто соеденили кнопку из сториборда, а еще и обрабатываем нажатие на эту кнопку
        
        
        //Проверяем, есть ли значения в тектовых полей. Причем, если значения есть, сразу создаются переменные со значениями из этих текстовых полей: day, month, year
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {
            return
        }
        
        let calendar = Calendar.current //создаем объект календарь, у него устанавливаем тип как текщий системный. Этим мы определяем, какой календарь будем использовать. В хелпе можно посмотреть другие типы календарей
        
        //Теперь мы указываем. из каких компонентов м ыбудем собипать нашу дату, т.е. из дня, месяца и года
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        
        //Теперь собираем дату
        let dateFormatter = DateFormatter() //Создаем экземпляр
        
        dateFormatter.locale = Locale(identifier: "ru_RU") //Вот здесь мы говорим, что нам нужен русский календарь
        dateFormatter.dateFormat = "EEEE" //Вот эти ЕЕЕЕ устанавливают формат данных
        
        //Проверяем, создается ли у нас объект со всеми нужными свойствами и если да,  создаем константу date в которую кладем дату, вызывая у объекта calendare функцию date в которую передаем НАШ объект dateComponents
        guard let date = calendar.date(from: dateComponents) else {return}
        
        
        let weekday = dateFormatter.string(from: date) //Приводим дату к строковому виду
        let capitalazedWeekday = weekday.capitalized //Делаем первый символ заглавным
        
        resultLabel.text = capitalazedWeekday //Передаем нашу строку в Label на сториборде
        
    }
    
    
    //Этот класс нам не нужен, создается автоматически
    //override func viewDidLoad() {
    //    super.viewDidLoad()
    //    // Do any additional setup after loading the view.
    //}


    //Переопределяем функцию, которая ответственна за троганье экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //Здесь мы говорим, что как только мы фокус увели с текстовых полей, клавиатуру нужно прятать
    }
    
    
    
}

