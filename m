Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA77C70BB9
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 20:09:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C03B13F944
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 19:09:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lists.linaro.org (Postfix) with ESMTPS id 577763F8F7
	for <greybus-dev@lists.linaro.org>; Wed, 19 Nov 2025 19:09:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=P0h53sdH;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkCVP2188535;
	Wed, 19 Nov 2025 19:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASAZP+CpN0Km755eVCZowGzENqfCD1bECHnPKs/EgZs=; b=P0h53sdH3jsA+Hvr
	0uxXGHBncEXEeCpd+pbKKQR+0/QYvgTYw89mUF8fCH7TWAS36Dlru51e/Dhfcvze
	NqYqUDtyYtUTmvGVM0PCCjUDjJhxDsQ0hOn1eqS8YMGoqNJ86P7gV3vQvVkMEos+
	r1iJAjbIpoTKCkpTsJSNgu8fzmA5Mh5TAhpQPay2e2th8I9B+cSjk30mwBfzLazj
	/Svqw6NeMQVnYPeHVJ+NZaTwG7I5em981dlcU74JYQfSkFLmyqG5zMEzvJHbvKxF
	e0hzvvemADICHIodK/AYohPCEflNQVED7ma4YjnHQQfckZX7HKe5tN2R1Pe8RE2i
	KnWPFg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr1957-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 19:09:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AJJ9LTH018696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 19:09:21 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 11:09:20 -0800
Message-ID: <141fadc2-ac5e-4fec-aee5-bcfe48ac4ad8@quicinc.com>
Date: Wed, 19 Nov 2025 11:08:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dharanitharan R <dharanitharan725@gmail.com>,
        <greybus-dev@lists.linaro.org>
References: <20251119043005.7382-1-dharanitharan725@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20251119043005.7382-1-dharanitharan725@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691e15e1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=LL8l9Ul7xDMtARhCP7EA:9
 a=QEXdDO2ut3YA:10 a=VxAk22fqlfwA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE1MCBTYWx0ZWRfX2REzLkKw5Sgs
 V0p0uGKler1eaPAw8yn6yGJ77fiVl8VM+ElNWPIQKPahc7zuuwtZ7rsDbRBVm+K4EJWRnMamTIa
 oY/UX4Vfycgvw9ET9wk91KQ0zjs8GJ3N5Wqg/Y9z/Pb06epidIzHv+wAjTTehb3faV8bz1WSsVJ
 u2RKT4U7n0VgIIqOxjzqDjJWp8GvC6uT8RkC8dopMxBCgNmaitDtRMz0HwZilRxfiDKoIDR5Tu+
 iIsGX6FtQlxw51p5KbHzfrm+yV0F7rXs2XpGMhpKP9MPJt2XBM7xjHMdGsMxNe1roEPC4l19+i0
 o3iMkb4oZYGoMc9raloRODFA5QX09jaEneaPUUCpfK0Cm14DiJwLOn7L9ZPOp8Z4Wvo1GD6+xd9
 tuvYPOvPV+EVbwxxPhWw9sLGvgnnhQ==
X-Proofpoint-ORIG-GUID: oqsbnw0izwkjq_Qx_UmbDj1MvcA4T1oh
X-Proofpoint-GUID: oqsbnw0izwkjq_Qx_UmbDj1MvcA4T1oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.84 / 15.00];
	BAYES_HAM(-2.84)[99.33%];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.168.131];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[205.220.168.131:server fail,129.46.96.20:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[205.220.168.131:from,129.46.96.20:received];
	HAS_XOIP(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 577763F8F7
X-Spamd-Bar: ---
Message-ID-Hash: XGCOZFUYZ7DX32CW7UU7A4DQCR4MDVJS
X-Message-ID-Hash: XGCOZFUYZ7DX32CW7UU7A4DQCR4MDVJS
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XGCOZFUYZ7DX32CW7UU7A4DQCR4MDVJS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Why are there two v3 patches? if you make any changes to a patch, increment
the version when you post again.

Also why did you drop the rationale for making the change that was present in
the original patch?

Most importantly, why did you ignore Dan's comment on your original patch?
https://msgid.link/aRwiEnEx4gX90eVh@stanley.mountain

/jeff


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
