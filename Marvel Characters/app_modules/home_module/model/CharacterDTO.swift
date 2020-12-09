//
//  CharacterDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct CharacterDTO: Codable {

    //MARK: Properties
    public var id: Int?
    public var name: String?
    public var description: String?
    public var thumbnail: ImageDTO?
    public var resourceURI: String?
    public var comics: CategoryDTO?
    public var series: CategoryDTO?
    public var stories: CategoryDTO?
    public var events: CategoryDTO?
    
    //MARK: Constructors
    init(){}
    
    public init(id: Int, name: String, description: String, thumbnail: ImageDTO, resourceURI: String, comics: CategoryDTO,
                series: CategoryDTO, stories: CategoryDTO, events: CategoryDTO) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
    }
    
}
