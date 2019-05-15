package com.comaniacs.dao;

import java.util.List;

import com.comaniacs.models.Show;

public interface ShowDao {
	
	public boolean checkIfTimmingsExist(Show show);
	
	public void addShowTimmings(Show show);
	
}
