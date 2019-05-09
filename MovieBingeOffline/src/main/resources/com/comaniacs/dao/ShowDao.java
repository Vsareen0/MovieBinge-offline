package com.comaniacs.dao;

import com.comaniacs.models.Show;

public interface ShowDao {
	
	public boolean checkIfTimmingsExist(Show show);
	
	public void addShowTimmings(Show show);
	
}
