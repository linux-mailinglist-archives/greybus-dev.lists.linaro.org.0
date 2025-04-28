Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C3A9F6E2
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Apr 2025 19:10:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4B1B43F1F
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Apr 2025 17:10:20 +0000 (UTC)
Received: from sonic311-21.consmr.mail.sg3.yahoo.com (sonic311-21.consmr.mail.sg3.yahoo.com [106.10.244.38])
	by lists.linaro.org (Postfix) with ESMTPS id 91BB743F1F
	for <greybus-dev@lists.linaro.org>; Mon, 28 Apr 2025 16:08:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=yahoo.com header.s=s2048 header.b=prEXNT1y;
	dmarc=pass (policy=reject) header.from=yahoo.com;
	spf=pass (lists.linaro.org: domain of sridhar.arra@yahoo.com designates 106.10.244.38 as permitted sender) smtp.mailfrom=sridhar.arra@yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745856531; bh=VLcOt41PrL1t3Y+w2c4iRwS3H4eA69ks/2yDegArszY=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=prEXNT1ykNXrHzuQVGkcjaGsQv1+qTEphx53/ibjQ9XmlCE9ijblq1jXnhyPCeBjplKjN+utjyDL4+b5FEwawDoWzSoFVpj372zyIceAgFS/nTDdCFzRE/3tmPUCpwUMFCE5MG/KkW4eGhAYCbVS78DLrS46YMlquPW8wvYbTLrFdGmh7TAL/netxQ2XrdmMrWpG1hKh9pUWumPxjGajDxddOLUj1bhLeaeJbKRpClyQjAfSrSF48jeyErcTp3T5JpHlEJSx64/5cybZyJ4p7CY2GZEzomtR7Yxw3L8+RCRL7Vb1Ns2mBw8GLmls+QR6QAM01ufxUxHoSycSmbZraw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745856531; bh=JSASTLT6G2Ln4xa2I4GI30CjpTfFSqfT0SjATlRRvWO=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=csimAA/uZRUFzltMmiHWVjZOYieVEqEpSLZkpX2VIBNYp/HY6KGuVLOt01+hQoGJyL11Gn9M8K7UnLOXaGL2J8LmdDFYHlBEeI3frLILf3pk976gdSF7sCdqMadfsoK18PcvqrtcYpmrFJLIwyX0hT6lRDnjbf6BSv+zlbAsosBU0NmBP+NcK5yBx2c9+IwP6j0LLeMf+lOjlHLG44K/pP2XqpOjYFcw3uXHKNXe1i1DhGtA8bPUw4FPBCbiiFGKKdeh9wI4BWHw2RlI7A3mSiKe8hukDK0IHr0/FJoo4wMLJbDKaWCEwSaEascUr0w02sHA4aWzkfjAy3ugHz68nQ==
X-YMail-OSG: rPr3dOgVM1lzZp_coWwp3tcrJGdx4SUaaB618vcSGgFN6tg_Vv4bf1_uXEkVSXQ
 DNX2TUzHUIYlVYOa.m9YqDCHVPh6P81c.uIdtoPl2sVt_1FYQSVk2EaVoxC.wlzOlgF_3Y8qRb.R
 dnZuPAZJjWeofE0orP3RFV_vfydYhb3q8PbOJx5lMsInOWjnmlx1kT8oe3I9pUPnVOJo7e0BfTfS
 7SPzfL9flurJ1Jg4EY4I9GZ0.FrIXgezSIxWpmb_PWbXxNhh9yGGfyRMaU8rdRGlrkJJ1RYYUL3Y
 dQMU2WQdxdr.y9Z_0NG.yUrcithXFzfawoYFm_lE9RDqJrhjOjQEKVDqcirrnTss_9W5UZy0c19u
 7C_hl5zz6UwsRehIKMxxmzbtgMxkHlFN86yB21QjMl9PG4qdA5325tVO.glOISYuPgDl4e.s87tl
 2R_HDiLycF2PaiOFzswbY88q2iHgSkQTJGqbqEK_Ivk_owUxgrK.cdd3MMS6d62nHRwVBi8PCS73
 xlha0LipEOcnHRNf7uOrVKluWKfT3PmfWRc1FmVXVof8BMH4M_G8HeU3t4Nq1SkyfVq8KDE85n2a
 KHi_PyHIOB_Xw.f739CFj5r65M1WvZc98qjGL985FnqkRvC71gx0y1cuo2_0UwBihxPRSgS1HuaA
 yQqLlKowQ_8Sxwb5qiiXOoSVQ6jP41FScTW9IQ5Dn_A05mPCyyTILHRc9wx57priVPRT5xmeVEL5
 lyVoSBULG9bwfLi91.UlTUoZ9YeZXO8t5C9uxR1XMT0KMifnVLO9LrU6wpGycvJGcTs1a1TGywug
 u.zUKN3gsZ2SAZc4gdWfhEojLC_7avlVMYuwXefkG1PBlUqZTxnFk6IgDr1_Au90Z9YobFS43CXI
 m7peKM8BhIAkXCoMHHk_F2aJVbVFrpv4wo8BGdraCCuiQPL1dbruSIN01Cg7EmqVy43glFPd0z0S
 NKEOsAfwAWm0m4OUmdjVFnJI.CsyEdSyTMEarsKcysDdr1rqyxnn7K2gl3R4SGU3MDr6hpBTnAXq
 ZbjFzr1izBJyHZUaj3fEokeepSLDan_IBfJQP1lG7ZKXapzNRQkt2ULync5pO_HP5E6nTPXwiLkL
 efCVzBYDKT7krl7yo4JJoS858eMPFZnOBlHc7oHMnLUIvKB9vKSUaE2z3IlNI06lOj50wXBtuEJH
 KIYZRfVybzqfc1VS3f7AmEX0G.lY_Y7D4nYCCnvamdcasikrAiguE0M6HJldysFokmcBGLaHKm.w
 sc52SwA8nt_aTqy2sJo1jHwoVQHzHayCgX2.glB2elT31xvrrm4p3FBHNBsHeSPt5IYzJw6_cOr1
 k7GzaWhpebE2h9sxrdrYvOIPCcnIG1ZnCoD0n0eGBgS5LiV2eoLXvmAukXVi3n0dHhX4CW6yxjaL
 ivdnJReJwdnu4Dx88GUtwKeyoIxWbHlnGmo0DAedsDmPEvs2Cf1XIy4YPPHJ_KSHnKPmMi7ZB1rb
 fWMQ79Pxl2mF65lc7ay5rlf5zD1QAqj2Pq3DttEqk.m_xm15BxqI5fTUeFkKkKn0cKiYX4newHHD
 L1_C_wikGt3kXoKfFQVJUv_7CWGWrCl4XFJSpZ9Ghcv37IXwNGrc25nOO94bVY1no.LWFzzDNGPG
 TvKWbQESFBZpEMpZJWL9O3IXPQISvWYU3rYGPvVUTqkq1e7T55JRvowwx4m0SflELJXQcARUhyua
 IWSmSToGEb2qREoWWlDoTDD5MyaJTC5om4U7sLBhUUn_PwIwPHEy.60RUzpyPOsuTMezUeAN4aBp
 xewXZpMKwRL2h1tWF8Ki3gQ_MfUZ2jdCDCWGIxh4mVfxw6jVIyy0AmFD00zotPGjnxIiRermV4pH
 WMRy3VmqA2oMmXOz9TsBQN4KxjeYh_qMKpQIsxIph7sTNPKxuKzAFTj2gAQcFJFfCicO1LwALa2p
 YSg.J0YtJxjhyfS1W64gBTIGUjQ1j4j73w4tlWs7gePIIcyaKbgR1umvVPv4gcMyTubl5Sn6B5rL
 Dl2g8oHzTFdYQM2hSBfNN_LyFcevxekl8iCzscbp9E.MkZ51v9L6yOK6yzuJTN3Ggre7tNRHTYsO
 bLcZjRYlTWdcZueK3GF2FAuS2F3UFsuRY89iwk8YRPcJ8I4DxEvkzo3ZpAteE11u.csO.2x4HEUO
 PeAD_5sll6hDUpv3yHh8G8zUknqgGWmGnjc.0Dp1yxQl686MCB7TAdM0iiO.xT05qdKVV34fL2pD
 jhr1fEFdD43YtWF5vs37nbUOP2fWdomD4XMVWqXA3YafAhXIfDFyxTueHXrg-
X-Sonic-MF: <sridhar.arra@yahoo.com>
X-Sonic-ID: 3e50eaa4-aed4-4bc8-8fee-61ed46524e8f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.sg3.yahoo.com with HTTP; Mon, 28 Apr 2025 16:08:51 +0000
Received: by hermes--production-sg3-cdfd77c9c-5kclf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 69441e8edc2b0b466e94cefa32871180;
          Mon, 28 Apr 2025 16:08:47 +0000 (UTC)
From: Sridhar Arra <sridhar.arra@yahoo.com>
To: vireshk@kernel.org
Date: Mon, 28 Apr 2025 21:38:37 +0530
Message-ID: <20250428160837.664000-2-sridhar.arra@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>
References: <20250428160837.664000-1-sridhar.arra@yahoo.com>
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 91BB743F1F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[106.10.244.38:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.com,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.com:s=s2048];
	R_SPF_ALLOW(-0.20)[+ptr:yahoo.com];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[yahoo.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,yahoo.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:56173, ipnet:106.10.224.0/19, country:SG];
	FREEMAIL_ENVFROM(0.00)[yahoo.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[yahoo.com:+];
	DNSWL_BLOCKED(0.00)[106.10.244.38:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[106.10.244.38:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: sridhar.arra@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EXZ2R7YONKLHPAU4Q2VTTWQSOGZT4TVA
X-Message-ID-Hash: EXZ2R7YONKLHPAU4Q2VTTWQSOGZT4TVA
X-Mailman-Approved-At: Mon, 28 Apr 2025 17:10:12 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sridhar Arra <sridhar.arra@yahoo.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/2] [PATCH V2 2/2] staging: greybus: fix indentation in fw_mgmt_ioctl()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EXZ2R7YONKLHPAU4Q2VTTWQSOGZT4TVA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Corrects indentation to comply with checkpatch guidelines.

Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 56725b711a17..413a4d4f4e40 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -461,7 +461,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
