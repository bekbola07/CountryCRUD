package org.example.dto;

import lombok.Builder;

import java.util.UUID;

@Builder
public record RegionDTO(UUID id, String name, String country) {
}
