//
//  CalendarPickController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/31/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import KDCalendar

protocol CalendarPickControllerDelegate : NSObjectProtocol{
    func handleSelection(data: String)
}

class CalendarPickController: UIViewController, CalendarViewDataSource, CalendarViewDelegate {
    
    @IBOutlet weak var calendarView: CalendarView!
    weak var delegate : CalendarPickControllerDelegate?
    
    func endDate() -> Date {
        let today = Date()
        
        return today
    }
    
    func headerString(_ input: Date) -> String? {
        return ControllerUtil.dateToString(date: input, format: Constants.MMMMyyyyFormat)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myStyle = CalendarView.Style()
        myStyle.cellTextColorWeekend = UIColor.green
        myStyle.headerFont = UIFont(name: "Futura-Bold", size: 16)!
        myStyle.headerBackgroundColor = UIColor.lightText
        myStyle.cellColorOutOfRange = UIColor.lightGray
        myStyle.cellColorToday = UIColor.lightText
        myStyle.cellTextColorDefault = UIColor.white
        myStyle.cellFont = UIFont(name: "Futura-Medium", size: 15)!
        myStyle.weekdaysFont = UIFont(name: "Futura-CondensedMedium", size: 17)!
        myStyle.weekdaysTextColor = UIColor.black
        myStyle.firstWeekday = .sunday
        myStyle.calendar.timeZone = TimeZone.current
        myStyle.calendar.locale = Locale.current
        myStyle.cellSelectedColor = UIColor.lightGray

        // set your values
        calendarView.style = myStyle
        calendarView.marksWeekends = true
        calendarView.multipleSelectionEnable = false
        calendarView.dataSource = self
        calendarView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var date = Date()
        
        if let pickedDate = UserDefaults.standard.string(forKey: Constants.pickedDate),
            let dateSelected = ControllerUtil.stringToDate(dateStr: pickedDate, format: Constants.yyyyMMddFormat) {
            date = dateSelected
        }
        
        self.calendarView.setDisplayDate(date, animated: false)
    }
    
    func startDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = -24
        return self.calendarView.calendar.date(byAdding: dateComponents, to: Date() + 10)!
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
    
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, withEvents events: [CalendarEvent]) {
        if let delegate = delegate {
            delegate.handleSelection(data: ControllerUtil.dateToString(date: date, format: Constants.yyyyMMddFormat)!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
    
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
        
    }
    
}
