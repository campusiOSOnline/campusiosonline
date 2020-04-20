//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

class ___VARIABLE_ModuleName___WireFrame: ___VARIABLE_ModuleName___WireFrameProtocol {

    class func create___VARIABLE_ModuleName___Module() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "___VARIABLE_ModuleName___View")
        if let view = navController.children.first as? ___VARIABLE_ModuleName___View {
            let presenter: ___VARIABLE_ModuleName___PresenterProtocol & ___VARIABLE_ModuleName___InteractorOutputProtocol = ___VARIABLE_ModuleName___Presenter()
            let interactor: ___VARIABLE_ModuleName___InteractorInputProtocol & ___VARIABLE_ModuleName___RemoteDataManagerOutputProtocol = ___VARIABLE_ModuleName___Interactor()
            let localDataManager: ___VARIABLE_ModuleName___LocalDataManagerInputProtocol = ___VARIABLE_ModuleName___LocalDataManager()
            let remoteDataManager: ___VARIABLE_ModuleName___RemoteDataManagerInputProtocol = ___VARIABLE_ModuleName___RemoteDataManager()
            let wireFrame: ___VARIABLE_ModuleName___WireFrameProtocol = ___VARIABLE_ModuleName___WireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "___VARIABLE_ModuleName___View", bundle: Bundle.main)
    }
    
}
