package org.example.dto;

import lombok.Builder;

import java.util.UUID;

@Builder
public record DistrictDTO(UUID id, String name, String country, String region) {
}
