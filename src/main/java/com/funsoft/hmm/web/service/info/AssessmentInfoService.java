package com.funsoft.hmm.web.service.info;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.BlockAssessmentInfo;
import com.funsoft.hmm.web.domain.BlockAssessmentInfo.AssessmentLevel;
import com.funsoft.hmm.web.domain.BlockAssessmentInfo.BlockAssessment;
import com.funsoft.hmm.web.service.BlockSmallService;

/**
 * 건전도 평가 구현 서비스 클래스
 * 
 * @author hgko
 *
 */
@Service
public class AssessmentInfoService {
	
	@Autowired
	private BlockSmallService blockSmallService;

	/**
	 * 블록평가 조회
	 * @return
	 */
	public List<BlockAssessment> getBlockAssessmentList() {
		List<BlockAssessment> assessments = new ArrayList<>();
		
		blockSmallService.getList().forEach(data -> {
			BlockAssessment info = new BlockAssessment(data.getFlctcFm(), data.getBkNm(), 73.929f, 0.83989853, 0, 
					"00.00%", "00.00%", "00.31%", "00.00%", 0, 0, data.getCoords());
			assessments.add(info);
		});
		
		return assessments;
	}
	
	public BlockAssessmentInfo createBlockAssessmentInfo(long blockId) {
		BlockAssessmentInfo info = new BlockAssessmentInfo();
		info.setLevel(9);
		info.setAssessmentLevel(AssessmentLevel.주의);
		info.setTotalScore(60.701f);
		info.setContent("노후관이 많고 내식성관이 많고 제수 밸브 수가 낮고 소화전 수가 낮으나 초과수압이 적고 사고이력이 적음");
		
		return info;
	}
}
