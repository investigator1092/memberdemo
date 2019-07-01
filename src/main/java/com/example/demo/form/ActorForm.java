package com.example.demo.form;

import java.io.Serializable;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class ActorForm implements Serializable {

	private static final String ACTOR_VALIDATION_NOT_NULL = "{actor.validation.not.null}";

    private static final long serialVersionUID = 1330043957072942381L;

    @NotNull(message = ACTOR_VALIDATION_NOT_NULL)
    @Size(min=1, max=30, message="{}")
    private String name;
    @Min(value=100, message="100" + "{actor.validation.min}")
    @Max(value=250, message="250" + "{actor.validation.max}")
    private String height;
    @Pattern(regexp="A|B|AB|O", message="{actor.validation.blood}")
    private String blood;
    @Pattern(regexp="(\\d{4}/\\d{2}/\\d{2})", message="{actor.validation.birthday}")
    private String birthday;
    @NotNull(message=ACTOR_VALIDATION_NOT_NULL)
    @Min(value=1, message="actor.validation.not.default")
    @Max(48)
    private String birthplaceId;
}