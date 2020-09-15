// MARK: - Mocks generated from file: WeatherApp/View/MapView.swift at 2020-09-15 22:01:55 +0000

//
//  MapView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Cuckoo
@testable import WeatherApp

import Foundation
import MapKit

class MockMapView: MapView, Cuckoo.ProtocolMock {
    typealias MocksType = MapView
    typealias Stubbing = __StubbingProxy_MapView
    typealias Verification = __VerificationProxy_MapView
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "configureAllAnnotationPoint", "returnSignature": "", "fullyQualifiedName": "configureAllAnnotationPoint(annotation: MKPointAnnotation)", "parameterSignature": "annotation: MKPointAnnotation", "parameterSignatureWithoutNames": "annotation: MKPointAnnotation", "inputTypes": "MKPointAnnotation", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "annotation", "call": "annotation: annotation", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("annotation"), name: "annotation", type: "MKPointAnnotation", range: CountableRange(223..<253), nameRange: CountableRange(223..<233))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureAllAnnotationPoint(annotation: MKPointAnnotation)  {
        
            return cuckoo_manager.call("configureAllAnnotationPoint(annotation: MKPointAnnotation)",
                parameters: (annotation),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "setUserLocation", "returnSignature": "", "fullyQualifiedName": "setUserLocation(value: Bool)", "parameterSignature": "value: Bool", "parameterSignatureWithoutNames": "value: Bool", "inputTypes": "Bool", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "value", "call": "value: value", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("value"), name: "value", type: "Bool", range: CountableRange(280..<291), nameRange: CountableRange(280..<285))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func setUserLocation(value: Bool)  {
        
            return cuckoo_manager.call("setUserLocation(value: Bool)",
                parameters: (value),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureAllPinsWithZoomout", "returnSignature": "", "fullyQualifiedName": "configureAllPinsWithZoomout()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureAllPinsWithZoomout()  {
        
            return cuckoo_manager.call("configureAllPinsWithZoomout()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_MapView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func configureAllAnnotationPoint<M1: Cuckoo.Matchable>(annotation: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(MKPointAnnotation)> where M1.MatchedType == MKPointAnnotation {
	        let matchers: [Cuckoo.ParameterMatcher<(MKPointAnnotation)>] = [wrap(matchable: annotation) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMapView.self, method: "configureAllAnnotationPoint(annotation: MKPointAnnotation)", parameterMatchers: matchers))
	    }
	    
	    func setUserLocation<M1: Cuckoo.Matchable>(value: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: value) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMapView.self, method: "setUserLocation(value: Bool)", parameterMatchers: matchers))
	    }
	    
	    func configureAllPinsWithZoomout() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMapView.self, method: "configureAllPinsWithZoomout()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MapView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func configureAllAnnotationPoint<M1: Cuckoo.Matchable>(annotation: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == MKPointAnnotation {
	        let matchers: [Cuckoo.ParameterMatcher<(MKPointAnnotation)>] = [wrap(matchable: annotation) { $0 }]
	        return cuckoo_manager.verify("configureAllAnnotationPoint(annotation: MKPointAnnotation)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func setUserLocation<M1: Cuckoo.Matchable>(value: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: value) { $0 }]
	        return cuckoo_manager.verify("setUserLocation(value: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureAllPinsWithZoomout() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("configureAllPinsWithZoomout()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MapViewStub: MapView {
    

    

    
     func configureAllAnnotationPoint(annotation: MKPointAnnotation)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func setUserLocation(value: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureAllPinsWithZoomout()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/View/WeatherDetailsView.swift at 2020-09-15 22:01:55 +0000

//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/13.
//  Copyright © 2020 DVT. All rights reserved.
//

import Cuckoo
@testable import WeatherApp

import Foundation

class MockWeatherDetailsView: WeatherDetailsView, Cuckoo.ProtocolMock {
    typealias MocksType = WeatherDetailsView
    typealias Stubbing = __StubbingProxy_WeatherDetailsView
    typealias Verification = __VerificationProxy_WeatherDetailsView
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "configureWeatherBackground", "returnSignature": "", "fullyQualifiedName": "configureWeatherBackground(state: CurrentWeatherState, type: String)", "parameterSignature": "state: CurrentWeatherState, type: String", "parameterSignatureWithoutNames": "state: CurrentWeatherState, type: String", "inputTypes": "CurrentWeatherState, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "state, type", "call": "state: state, type: type", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("state"), name: "state", type: "CurrentWeatherState", range: CountableRange(230..<256), nameRange: CountableRange(230..<235)), CuckooGeneratorFramework.MethodParameter(label: Optional("type"), name: "type", type: "String", range: CountableRange(258..<270), nameRange: CountableRange(258..<262))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureWeatherBackground(state: CurrentWeatherState, type: String)  {
        
            return cuckoo_manager.call("configureWeatherBackground(state: CurrentWeatherState, type: String)",
                parameters: (state, type),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureCityName", "returnSignature": "", "fullyQualifiedName": "configureCityName(cityName: String)", "parameterSignature": "cityName: String", "parameterSignatureWithoutNames": "cityName: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "cityName", "call": "cityName: cityName", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("cityName"), name: "cityName", type: "String", range: CountableRange(299..<315), nameRange: CountableRange(299..<307))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureCityName(cityName: String)  {
        
            return cuckoo_manager.call("configureCityName(cityName: String)",
                parameters: (cityName),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureSavedTempreture", "returnSignature": "", "fullyQualifiedName": "configureSavedTempreture(temp: String)", "parameterSignature": "temp: String", "parameterSignatureWithoutNames": "temp: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "temp", "call": "temp: temp", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("temp"), name: "temp", type: "String", range: CountableRange(351..<363), nameRange: CountableRange(351..<355))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureSavedTempreture(temp: String)  {
        
            return cuckoo_manager.call("configureSavedTempreture(temp: String)",
                parameters: (temp),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureSunriseAndSunset", "returnSignature": "", "fullyQualifiedName": "configureSunriseAndSunset(sunrise: String, sunset: String)", "parameterSignature": "sunrise: String, sunset: String", "parameterSignatureWithoutNames": "sunrise: String, sunset: String", "inputTypes": "String, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "sunrise, sunset", "call": "sunrise: sunrise, sunset: sunset", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("sunrise"), name: "sunrise", type: "String", range: CountableRange(400..<415), nameRange: CountableRange(400..<407)), CuckooGeneratorFramework.MethodParameter(label: Optional("sunset"), name: "sunset", type: "String", range: CountableRange(417..<431), nameRange: CountableRange(417..<423))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureSunriseAndSunset(sunrise: String, sunset: String)  {
        
            return cuckoo_manager.call("configureSunriseAndSunset(sunrise: String, sunset: String)",
                parameters: (sunrise, sunset),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configurePressureAndHumidity", "returnSignature": "", "fullyQualifiedName": "configurePressureAndHumidity(pressure: String, humidity: String)", "parameterSignature": "pressure: String, humidity: String", "parameterSignatureWithoutNames": "pressure: String, humidity: String", "inputTypes": "String, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "pressure, humidity", "call": "pressure: pressure, humidity: humidity", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("pressure"), name: "pressure", type: "String", range: CountableRange(471..<487), nameRange: CountableRange(471..<479)), CuckooGeneratorFramework.MethodParameter(label: Optional("humidity"), name: "humidity", type: "String", range: CountableRange(489..<505), nameRange: CountableRange(489..<497))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configurePressureAndHumidity(pressure: String, humidity: String)  {
        
            return cuckoo_manager.call("configurePressureAndHumidity(pressure: String, humidity: String)",
                parameters: (pressure, humidity),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureVisibilityAndFeelsLikeTemp", "returnSignature": "", "fullyQualifiedName": "configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)", "parameterSignature": "visibility: String, feelsLike: String", "parameterSignatureWithoutNames": "visibility: String, feelsLike: String", "inputTypes": "String, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "visibility, feelsLike", "call": "visibility: visibility, feelsLike: feelsLike", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("visibility"), name: "visibility", type: "String", range: CountableRange(552..<570), nameRange: CountableRange(552..<562)), CuckooGeneratorFramework.MethodParameter(label: Optional("feelsLike"), name: "feelsLike", type: "String", range: CountableRange(572..<589), nameRange: CountableRange(572..<581))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)  {
        
            return cuckoo_manager.call("configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)",
                parameters: (visibility, feelsLike),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureHighAndLowTemp", "returnSignature": "", "fullyQualifiedName": "configureHighAndLowTemp(max: String, min: String)", "parameterSignature": "max: String, min: String", "parameterSignatureWithoutNames": "max: String, min: String", "inputTypes": "String, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "max, min", "call": "max: max, min: min", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("max"), name: "max", type: "String", range: CountableRange(624..<635), nameRange: CountableRange(624..<627)), CuckooGeneratorFramework.MethodParameter(label: Optional("min"), name: "min", type: "String", range: CountableRange(637..<648), nameRange: CountableRange(637..<640))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureHighAndLowTemp(max: String, min: String)  {
        
            return cuckoo_manager.call("configureHighAndLowTemp(max: String, min: String)",
                parameters: (max, min),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_WeatherDetailsView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func configureWeatherBackground<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(state: M1, type: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(CurrentWeatherState, String)> where M1.MatchedType == CurrentWeatherState, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(CurrentWeatherState, String)>] = [wrap(matchable: state) { $0.0 }, wrap(matchable: type) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configureWeatherBackground(state: CurrentWeatherState, type: String)", parameterMatchers: matchers))
	    }
	    
	    func configureCityName<M1: Cuckoo.Matchable>(cityName: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: cityName) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configureCityName(cityName: String)", parameterMatchers: matchers))
	    }
	    
	    func configureSavedTempreture<M1: Cuckoo.Matchable>(temp: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: temp) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configureSavedTempreture(temp: String)", parameterMatchers: matchers))
	    }
	    
	    func configureSunriseAndSunset<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(sunrise: M1, sunset: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: sunrise) { $0.0 }, wrap(matchable: sunset) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configureSunriseAndSunset(sunrise: String, sunset: String)", parameterMatchers: matchers))
	    }
	    
	    func configurePressureAndHumidity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(pressure: M1, humidity: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: pressure) { $0.0 }, wrap(matchable: humidity) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configurePressureAndHumidity(pressure: String, humidity: String)", parameterMatchers: matchers))
	    }
	    
	    func configureVisibilityAndFeelsLikeTemp<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(visibility: M1, feelsLike: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: visibility) { $0.0 }, wrap(matchable: feelsLike) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)", parameterMatchers: matchers))
	    }
	    
	    func configureHighAndLowTemp<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(max: M1, min: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: max) { $0.0 }, wrap(matchable: min) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherDetailsView.self, method: "configureHighAndLowTemp(max: String, min: String)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherDetailsView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func configureWeatherBackground<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(state: M1, type: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == CurrentWeatherState, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(CurrentWeatherState, String)>] = [wrap(matchable: state) { $0.0 }, wrap(matchable: type) { $0.1 }]
	        return cuckoo_manager.verify("configureWeatherBackground(state: CurrentWeatherState, type: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureCityName<M1: Cuckoo.Matchable>(cityName: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: cityName) { $0 }]
	        return cuckoo_manager.verify("configureCityName(cityName: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureSavedTempreture<M1: Cuckoo.Matchable>(temp: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: temp) { $0 }]
	        return cuckoo_manager.verify("configureSavedTempreture(temp: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureSunriseAndSunset<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(sunrise: M1, sunset: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: sunrise) { $0.0 }, wrap(matchable: sunset) { $0.1 }]
	        return cuckoo_manager.verify("configureSunriseAndSunset(sunrise: String, sunset: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configurePressureAndHumidity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(pressure: M1, humidity: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: pressure) { $0.0 }, wrap(matchable: humidity) { $0.1 }]
	        return cuckoo_manager.verify("configurePressureAndHumidity(pressure: String, humidity: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureVisibilityAndFeelsLikeTemp<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(visibility: M1, feelsLike: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: visibility) { $0.0 }, wrap(matchable: feelsLike) { $0.1 }]
	        return cuckoo_manager.verify("configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureHighAndLowTemp<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(max: M1, min: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: max) { $0.0 }, wrap(matchable: min) { $0.1 }]
	        return cuckoo_manager.verify("configureHighAndLowTemp(max: String, min: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherDetailsViewStub: WeatherDetailsView {
    

    

    
     func configureWeatherBackground(state: CurrentWeatherState, type: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureCityName(cityName: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureSavedTempreture(temp: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureSunriseAndSunset(sunrise: String, sunset: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configurePressureAndHumidity(pressure: String, humidity: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureVisibilityAndFeelsLikeTemp(visibility: String, feelsLike: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureHighAndLowTemp(max: String, min: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/View/WeatherView.swift at 2020-09-15 22:01:55 +0000

//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Cuckoo
@testable import WeatherApp

import Foundation

class MockWeatherView: WeatherView, Cuckoo.ProtocolMock {
    typealias MocksType = WeatherView
    typealias Stubbing = __StubbingProxy_WeatherView
    typealias Verification = __VerificationProxy_WeatherView
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "configureView", "returnSignature": "", "fullyQualifiedName": "configureView()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureView()  {
        
            return cuckoo_manager.call("configureView()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureCurrentCity", "returnSignature": "", "fullyQualifiedName": "configureCurrentCity(city: String)", "parameterSignature": "city: String", "parameterSignatureWithoutNames": "city: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "city", "call": "city: city", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("city"), name: "city", type: "String", range: CountableRange(235..<247), nameRange: CountableRange(235..<239))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureCurrentCity(city: String)  {
        
            return cuckoo_manager.call("configureCurrentCity(city: String)",
                parameters: (city),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureTodaysTempreture", "returnSignature": "", "fullyQualifiedName": "configureTodaysTempreture(currentTemp: String)", "parameterSignature": "currentTemp: String", "parameterSignatureWithoutNames": "currentTemp: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "currentTemp", "call": "currentTemp: currentTemp", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("currentTemp"), name: "currentTemp", type: "String", range: CountableRange(284..<303), nameRange: CountableRange(284..<295))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureTodaysTempreture(currentTemp: String)  {
        
            return cuckoo_manager.call("configureTodaysTempreture(currentTemp: String)",
                parameters: (currentTemp),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureMinimumTempreture", "returnSignature": "", "fullyQualifiedName": "configureMinimumTempreture(minTemp: String)", "parameterSignature": "minTemp: String", "parameterSignatureWithoutNames": "minTemp: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "minTemp", "call": "minTemp: minTemp", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("minTemp"), name: "minTemp", type: "String", range: CountableRange(341..<356), nameRange: CountableRange(341..<348))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureMinimumTempreture(minTemp: String)  {
        
            return cuckoo_manager.call("configureMinimumTempreture(minTemp: String)",
                parameters: (minTemp),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureMaximumTempreture", "returnSignature": "", "fullyQualifiedName": "configureMaximumTempreture(maxTemp: String)", "parameterSignature": "maxTemp: String", "parameterSignatureWithoutNames": "maxTemp: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "maxTemp", "call": "maxTemp: maxTemp", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("maxTemp"), name: "maxTemp", type: "String", range: CountableRange(394..<409), nameRange: CountableRange(394..<401))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureMaximumTempreture(maxTemp: String)  {
        
            return cuckoo_manager.call("configureMaximumTempreture(maxTemp: String)",
                parameters: (maxTemp),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureForecastDataForWeek", "returnSignature": "", "fullyQualifiedName": "configureForecastDataForWeek(data: [List])", "parameterSignature": "data: [List]", "parameterSignatureWithoutNames": "data: [List]", "inputTypes": "[List]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "data", "call": "data: data", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("data"), name: "data", type: "[List]", range: CountableRange(449..<461), nameRange: CountableRange(449..<453))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureForecastDataForWeek(data: [List])  {
        
            return cuckoo_manager.call("configureForecastDataForWeek(data: [List])",
                parameters: (data),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "showActivityProgressView", "returnSignature": "", "fullyQualifiedName": "showActivityProgressView()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func showActivityProgressView()  {
        
            return cuckoo_manager.call("showActivityProgressView()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "hideActivityProgressView", "returnSignature": "", "fullyQualifiedName": "hideActivityProgressView()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func hideActivityProgressView()  {
        
            return cuckoo_manager.call("hideActivityProgressView()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureWeatherBackground", "returnSignature": "", "fullyQualifiedName": "configureWeatherBackground(state: CurrentWeatherState, type: String)", "parameterSignature": "state: CurrentWeatherState, type: String", "parameterSignatureWithoutNames": "state: CurrentWeatherState, type: String", "inputTypes": "CurrentWeatherState, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "state, type", "call": "state: state, type: type", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("state"), name: "state", type: "CurrentWeatherState", range: CountableRange(571..<597), nameRange: CountableRange(571..<576)), CuckooGeneratorFramework.MethodParameter(label: Optional("type"), name: "type", type: "String", range: CountableRange(599..<611), nameRange: CountableRange(599..<603))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureWeatherBackground(state: CurrentWeatherState, type: String)  {
        
            return cuckoo_manager.call("configureWeatherBackground(state: CurrentWeatherState, type: String)",
                parameters: (state, type),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "showRetryAlertIfConnectionFail", "returnSignature": "", "fullyQualifiedName": "showRetryAlertIfConnectionFail(title: String, message: String, offlineData: Bool)", "parameterSignature": "title: String, message: String, offlineData: Bool", "parameterSignatureWithoutNames": "title: String, message: String, offlineData: Bool", "inputTypes": "String, String, Bool", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "title, message, offlineData", "call": "title: title, message: message, offlineData: offlineData", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("title"), name: "title", type: "String", range: CountableRange(653..<666), nameRange: CountableRange(653..<658)), CuckooGeneratorFramework.MethodParameter(label: Optional("message"), name: "message", type: "String", range: CountableRange(668..<683), nameRange: CountableRange(668..<675)), CuckooGeneratorFramework.MethodParameter(label: Optional("offlineData"), name: "offlineData", type: "Bool", range: CountableRange(685..<701), nameRange: CountableRange(685..<696))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func showRetryAlertIfConnectionFail(title: String, message: String, offlineData: Bool)  {
        
            return cuckoo_manager.call("showRetryAlertIfConnectionFail(title: String, message: String, offlineData: Bool)",
                parameters: (title, message, offlineData),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_WeatherView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func configureView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureView()", parameterMatchers: matchers))
	    }
	    
	    func configureCurrentCity<M1: Cuckoo.Matchable>(city: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: city) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureCurrentCity(city: String)", parameterMatchers: matchers))
	    }
	    
	    func configureTodaysTempreture<M1: Cuckoo.Matchable>(currentTemp: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: currentTemp) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureTodaysTempreture(currentTemp: String)", parameterMatchers: matchers))
	    }
	    
	    func configureMinimumTempreture<M1: Cuckoo.Matchable>(minTemp: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: minTemp) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureMinimumTempreture(minTemp: String)", parameterMatchers: matchers))
	    }
	    
	    func configureMaximumTempreture<M1: Cuckoo.Matchable>(maxTemp: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: maxTemp) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureMaximumTempreture(maxTemp: String)", parameterMatchers: matchers))
	    }
	    
	    func configureForecastDataForWeek<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([List])> where M1.MatchedType == [List] {
	        let matchers: [Cuckoo.ParameterMatcher<([List])>] = [wrap(matchable: data) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureForecastDataForWeek(data: [List])", parameterMatchers: matchers))
	    }
	    
	    func showActivityProgressView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "showActivityProgressView()", parameterMatchers: matchers))
	    }
	    
	    func hideActivityProgressView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "hideActivityProgressView()", parameterMatchers: matchers))
	    }
	    
	    func configureWeatherBackground<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(state: M1, type: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(CurrentWeatherState, String)> where M1.MatchedType == CurrentWeatherState, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(CurrentWeatherState, String)>] = [wrap(matchable: state) { $0.0 }, wrap(matchable: type) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "configureWeatherBackground(state: CurrentWeatherState, type: String)", parameterMatchers: matchers))
	    }
	    
	    func showRetryAlertIfConnectionFail<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(title: M1, message: M2, offlineData: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, Bool)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String, Bool)>] = [wrap(matchable: title) { $0.0 }, wrap(matchable: message) { $0.1 }, wrap(matchable: offlineData) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherView.self, method: "showRetryAlertIfConnectionFail(title: String, message: String, offlineData: Bool)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func configureView() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("configureView()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureCurrentCity<M1: Cuckoo.Matchable>(city: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: city) { $0 }]
	        return cuckoo_manager.verify("configureCurrentCity(city: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureTodaysTempreture<M1: Cuckoo.Matchable>(currentTemp: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: currentTemp) { $0 }]
	        return cuckoo_manager.verify("configureTodaysTempreture(currentTemp: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureMinimumTempreture<M1: Cuckoo.Matchable>(minTemp: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: minTemp) { $0 }]
	        return cuckoo_manager.verify("configureMinimumTempreture(minTemp: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureMaximumTempreture<M1: Cuckoo.Matchable>(maxTemp: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: maxTemp) { $0 }]
	        return cuckoo_manager.verify("configureMaximumTempreture(maxTemp: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureForecastDataForWeek<M1: Cuckoo.Matchable>(data: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [List] {
	        let matchers: [Cuckoo.ParameterMatcher<([List])>] = [wrap(matchable: data) { $0 }]
	        return cuckoo_manager.verify("configureForecastDataForWeek(data: [List])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showActivityProgressView() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showActivityProgressView()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func hideActivityProgressView() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("hideActivityProgressView()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureWeatherBackground<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(state: M1, type: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == CurrentWeatherState, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(CurrentWeatherState, String)>] = [wrap(matchable: state) { $0.0 }, wrap(matchable: type) { $0.1 }]
	        return cuckoo_manager.verify("configureWeatherBackground(state: CurrentWeatherState, type: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showRetryAlertIfConnectionFail<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(title: M1, message: M2, offlineData: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String, Bool)>] = [wrap(matchable: title) { $0.0 }, wrap(matchable: message) { $0.1 }, wrap(matchable: offlineData) { $0.2 }]
	        return cuckoo_manager.verify("showRetryAlertIfConnectionFail(title: String, message: String, offlineData: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherViewStub: WeatherView {
    

    

    
     func configureView()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureCurrentCity(city: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureTodaysTempreture(currentTemp: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureMinimumTempreture(minTemp: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureMaximumTempreture(maxTemp: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureForecastDataForWeek(data: [List])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showActivityProgressView()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func hideActivityProgressView()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureWeatherBackground(state: CurrentWeatherState, type: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func showRetryAlertIfConnectionFail(title: String, message: String, offlineData: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

