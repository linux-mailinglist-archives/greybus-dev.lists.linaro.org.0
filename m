Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIJFKK9GqWl53gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Mar 2026 10:02:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673120DE16
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Mar 2026 10:02:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4178F3F70A
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Mar 2026 09:02:34 +0000 (UTC)
Received: from sonic309-24.consmr.mail.ir2.yahoo.com (sonic309-24.consmr.mail.ir2.yahoo.com [77.238.179.82])
	by lists.linaro.org (Postfix) with ESMTPS id 72E113F683
	for <greybus-dev@lists.linaro.org>; Thu,  5 Mar 2026 08:58:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=yahoo.pl header.s=s2048 header.b="N/QvKplq";
	dmarc=pass (policy=reject) header.from=yahoo.pl;
	spf=pass (lists.linaro.org: domain of tomasz.unger@yahoo.pl designates 77.238.179.82 as permitted sender) smtp.mailfrom=tomasz.unger@yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772701104; bh=e9+ACCgfVdF45dBZZ5vtGDLnIqv1E3MgAmm/fm6Pehw=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=N/QvKplq3l2s1eLYnycsFibzYWl6EU7jcvD0ZWcCAHE2XY/CswFn5bTPEsPdUsGdRzc3AahY4IoQljgilgd+0EuliOX9s0IB2y6yRdmFYbxM7wKJgrW9kECemRc0SqxgV8g6g2EHzAIbDPB6UKw1b8hvSt02VE8Tx6tzY5GrqE6BgRtvY6rhpeATukVNvbMxw2Xb4Yc2b+ay8WAsXptXplbzXTK4NaTyQIJFfwjYHSgP3TF0NriD0ChG5HjqZ6VDsXVATBrBNFU4UtjJPZE4c2G9L8owT0H/AlmCiRWj9DS/dtwNKKk5VvmDBsfBne9h87Z69iVrSFWbqxJzslIEjg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772701104; bh=6douQNp/Nvz4VGiIyVG4ZJdw2GC+5fHnpfK3PCGFVyq=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=N7KImXHc/OVxfgAX0Mm2f8RW3TdBj3QxCwivOnEdiiRBsBwxkGfa4Ok8wUtl9FKX3xGCQvAeRjinBPsSmFwfhM4A7S6yKsAkEwK8hph9DP2eU2Dk4Ioa5gkYMN09xQB7sM3NjpntjjUSZ2HJyw9FIbBcyjb43lszrcMQ4SQweNm+KBiQk6N5nBgAacEoD8SAHEW70u4Kt7/ZMfR5upOwOk0HSjmpF94pv4A534hchSunJby5gG4Nymo5rvuiR2P9MCnkMh8Co2CvpafDTYMb6IqBN0GQKgFQrF3hICEjaMaYFhPF5kwZzU1gaBW43z9ldg+rsLCeuNfsXKYV5mJ+Ng==
X-YMail-OSG: 78iBpsIVM1npZVgJN.xtQr75x4B6a7Jg8MvFXLdORUN5Fizm4URQ1w4PKsEr_2g
 zg7l.f2v36Jrw5YWb1J6cQMT0E8uQSM74UayHL14AuW4zzKL619e6FXbjmCOnZsu.zBe9EJYBlZ2
 UNWhi9d1lJqppQqLQA57KjSe2KJtZF5g75mt9T.Jnou5XrlE2LsfpRrnHb7kaBP531rlP4LDigbR
 XzeMt.BPZlWFZMB9egWNGYbvoKJldFJDMoklf5kTj7DMKlw116.Hmibkjh1PMQl.Nx1D0VXuWzNv
 AC.kGxuSXlucj8rlq.0tHoHzGzNpXNYNnEf4YPjn0sMsNNI2Qg1d3s_ohSE97vVMbcsCI_qncAJC
 7JorbaoPa2NGcI8PAhcdq_.DnwkdarClKokLepW.2zGpDt4Do65lUOpGUkGFRGN11L_Hn8akMR6O
 KvckpT9BtwcvRTRRQ_X1nR95qnmTD1AU2z5yb6JMwlqsPd0thvyPq_BfBi_DrGKkua_AKi7gmb63
 InLcF7e.SBVblAvnBpHWPJSlDRdgSIoTYFCJ.92fSnFUzOpQVUFfa0s_L8N1CeoFF7PMnD0Gu0nn
 LeJOsUXshPu9RJoo0uTUhUNrQWy5XI5Q440K35BqqX0H9lcl4MdCWfkZkvs57.fjwGXBs7U.donh
 jGH02ksnt6.cd6fs3K3dml0xg6XXwsZFCLmlIbK2ID9iDhAGUhWxfacxjTn_Q.K4ZsKng55VcqA_
 .ArBi9UDDC3MN2oubEvqi18JQzXmr8MpMJKKLc67yzMajc9K1rwZEZytLPgXL_41uacLYZq4PCUd
 EfLsqkB6XEJa.KawU1dcQ2s9b7.xS8dIrgqj_XWP4jwFmUwsf2i6ocw85ydTuk6A_vcqmQhyuV6W
 vNMe_8mYr4Gu1Izk3xIyl8cXqCi_exkjo4YxPpJ7tcVboD_ENWjUlVujPT2Iq2Utu2t2ANlOt1Aj
 YNAfb3SUx6d8ixznCFaAZUqzNS1YKNDdc5Ged.t9bL4WyGhTpNlROLjTkC3JF6_P5crTaUHhPIGX
 0q.S5qiF7RH_naWaMYupkms0Rl_aMnb39hQI52HhfogUpqHTooN6wSJPER1BlxtYgBD4TyZopXdC
 8RyzryuMx3st7E1T185ANsAic2EC6LKlrkgDUfI6hr1itoG5i7lj8Nf5lP.8fyBkDixj9TRrO6z6
 o2JjXogZOblwJ2zIwhLkxrvQfV3tg2F_iiV6Y1z2fOGBq49BRlVD3qjaA143I3P8ueh9avRHCZiB
 l_8DPXS155TIOpIsdn4ZxHDQ2MqjaJWZpO0aqcG.A.77cg8uaC_3oRjtHeyGyvo6BCfZrBTOM9lE
 YnfScr314Gw99WeETd9oKLJ9wTYp0e5scCEzfCZB.4Sxkyf8W9DWTtSqVz19ZU9Kp9uQzreWyo2h
 eXCvRF9UlhQNBc_iHbuV0hasJVJOBWwV8IC6TgVBwIQZVa6RV7y4bV9hW2ulsvbjRqEVV0B99ydg
 wql3RJQOdb6ziIpz5NymQ5cI8umRgfFpLeh7yi1y1PwWnxpEkvpJGlS2bjRIRpRETTlS4YMB1QFx
 EukGI14mpHmmskAUgQknOZATG4ZO8eHAwx95TVlePAGmR3Moi_vzV0u89F2iuRkA4X6Qk0eEN906
 tAjtgX7gqKOwfNMo_PH2ucHhO1scntU64dkmbW1hw.RbAtWRx.NYWkd.MchYzGMSEVSaJlGzbQR5
 D.R7khZostaCPKtM9jRykIvQYT4XcUonyLdgfblIg9shdG4uBDSorzRwFkaZMVQsOJIc5J.MQb3y
 g66nncjKzQ99K9GxwKvbWxOB.uEsksmLWFEwrXB_L8lm6u64Eg9kQj.b30mLxXuUIOp2reLTbbOE
 8mIlvOAR6CIdLFWr4sWwOhL2oVK1l9c0ynzoTxMErAkvfAyg29V.2BvQHncdR32AqO8cxbsVpg8k
 GrjmiN.hLcm59uMrlIYkNW.IgT5ep3u4R6Ip76KZbp2FMkFJuWwl5d6tgPVvljcWRzVpjeTUdIXS
 ecIV0Zb6vYqcFRujmM0snGL4gJi3cT5UchPRGzrneGHtvfxUxGBypo_JMjKDZRD6hRLCK2B277j0
 Xk9R.TTHWjkQyccWaqJIHXLnDP8o0l97DSZYoEk299MjzXw.yK7O3L83teS_klL2N6IRzAMVt9p0
 lMuyQ_5n7o._f9GXHl8w5MH73WlJzOyknY7iV.vgRd5.jRPXJV32bLaRPoBGiutkaanDMfllB4YC
 BjLIaf6ih719eByGX3EscKUnHN45aLKdo9mxuO_bLW1vjTFv2D9nTESz.uRvUqab1knt06KkOXuM
 3wuXyYwuJ2tppkqOUJ8QPxVm8uKRszwc53w--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 889f582a-5121-40e4-bcea-3dd9e22d90cd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ir2.yahoo.com with HTTP; Thu, 5 Mar 2026 08:58:24 +0000
Received: by hermes--production-ir2-bbcfb4457-c2jpm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 537325817d83b4fce5f78519c0b64c66;
          Thu, 05 Mar 2026 08:58:20 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 05 Mar 2026 09:58:19 +0100
MIME-Version: 1.0
Message-Id: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqAMAwA0atI1hZq6we8irioNtaARGlQFPHuF
 t0MvM3cIBgJBdrshogHCa2cUOQZjLPjgIp8Mhhtam11pULEa9hF7SwUGL1aVg5/sCnrymrj7eQ
 gDbaIE53fvOuf5wWj+1H7bAAAAA==
X-Change-ID: 20260305-greybus-unsigned-long-long-e7465302d3fa
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.3
References: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd.ref@yahoo.pl>
X-Spamd-Bar: ----
X-MailFrom: tomasz.unger@yahoo.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PGOYSMDSFZBFWBQ7FCXZ7M56RYEZWPY4
X-Message-ID-Hash: PGOYSMDSFZBFWBQ7FCXZ7M56RYEZWPY4
X-Mailman-Approved-At: Thu, 05 Mar 2026 09:02:31 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Prefer 'unsigned long long' over 'unsigned long long int'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PGOYSMDSFZBFWBQ7FCXZ7M56RYEZWPY4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5673120DE16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[yahoo.pl : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,yahoo.pl];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.881];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

Remove redundant 'int' keyword from 'unsigned long long int' type cast.
'unsigned long long' and 'unsigned long long int' are identical types
in C. Prefer the shorter form as suggested by checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..0ef88b7d24de 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");

---
base-commit: 6ae79e7736ee6a5f920867e5346d8a106cd1db74
change-id: 20260305-greybus-unsigned-long-long-e7465302d3fa

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
