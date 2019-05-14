package mic.main.classes;





import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "data")
public class SolarDB {
	
	private Timestamp datetime;
	
public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

@Id
@Column (name="id")
	private Integer id;
@Column (name="t1")
	private Float tDach;
@Column (name="t2")
	private Float tZb;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Float gettDach() {
		return tDach;
	}

	public void settDach(Float tDach) {
		this.tDach = tDach;
	}

	public Float gettZb() {
		return tZb;
	}

	public void settZb(Float tZb) {
		this.tZb = tZb;
	}
	
	
}
