Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC0hJC6Sg2lCpQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:38 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A143EBB6D
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D55C3F93E
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 18:38:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 833DC3F93E
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 18:30:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=AMl+rvUe;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09757004cso101705ad.3
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229843; x=1770834643; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N53mYQTvGj22FFA5zL3jaPnz1QUNn9+TPZEocHexi98=;
        b=AMl+rvUeKauzPYtOHKAZly02Jx2usIjvoTtFgaqaASKc0bRdWs68S0CxDK4xBfOqG7
         Ld9GJcVeEkEZTT/1F8wT4rSf5y70SsjQtWgiQmHlELomZKvFiDIUEpFlS60Eqzsvyl+1
         WFK6jGF0GZqCrd7bYrBQUU6CYeLFco3pSd7rtcmY9rHybncm3vQKy+FG3rSxrh2JqzSC
         fiuzfo29ei144akApa/+n5of0Cxrq07iCwDWfNZsRkH7pVbD+FiinH3N1QB9tERq7v3F
         158QXCYrRSdtfJU/WEeSLw+tTNiTW3p+L86pw2DKfWRl1FUEiYKfdPrXRGCmpKsXEQOZ
         CMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229843; x=1770834643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N53mYQTvGj22FFA5zL3jaPnz1QUNn9+TPZEocHexi98=;
        b=QPaBUYeD5vlJM9YCYwOZ823yFxeCJ9XMhy7O1Zw5iwEGLaft+nk91R0uCRIhhAZuds
         hdxIdlP02MQgyYnSdT4LeumderiKIFzjHCP7TinMadKlTXvXGONyxlw7YoHlGy/bpZKZ
         ujHe62rVgvZ7MzeKMzK/A2yeWElMF2g9pTVaHyL/8d0jSneaW6pQXg3oLiZwz0LvGTDn
         +w74MfmSaaEmjww1NTOp9zJIC+7Ko36sH8v1z73vtElotwGOICb2xKomDtdz3toQuDnO
         glmrcAAeypw99i4DvgA28Ef3T0VT2Uy/n4JkFLvMTicXA/C8OlPFYdzsN9ekZeVjPexC
         bzIg==
X-Forwarded-Encrypted: i=1; AJvYcCWdmzuBTfjgagCTohD5eqIe1c1apNqAsrvJeZyHxxFjfgRODe+r/pUoTOcoDbG02EKrQ/cSdxsG7sbotA==@lists.linaro.org
X-Gm-Message-State: AOJu0YyQ+SLR4tFHtDmwwTdmw56FlgOnjVk4DbDrhTrczVk/cJOP9LQe
	D8iIHYcg/SS0u2F2hgbiNjQIED/pcg7ArKjizmw6ICBvONB7Mvil0ROkADj4gA==
X-Gm-Gg: AZuq6aJ/xwZD1ErQX9+ZCWbO8HPLKuNMN5lltkhwe3BG16PEB+6Uw4gw+qUEBa4n49Z
	k2MxLv4f+3RlcqRRCHNkak9w+2/poH7BOW/OMC3vfGMrAVqi46/n//vLGmxgYJ6uwepON8o0bkD
	BR8f0bzAA9YdL5UtbgGvnjtoEeDzPZv2zxvN4R2/jRhfgIbC0UehUkH4EKZENVBWBqgzNrgM3Nz
	3HS2AMvza8JCtbBK1tS/tmASGJNdJeUdg+Oh7yjRjatnH3++6316cqaCj/w0+mgqUUKbioxIV1R
	TbC+SJ5oDfzr7je9OdzgZxmeBBm7xPFY9aCxcWlb7nEGLjhP8SsOKIg6Qls9DSIWowYYka/51Rp
	cDT+H/0FYJXDn2Q6OsoWYhoh33UxxXA+ASIbv09rxdm0jK1LP6cs/DwPYXbr6YkIjJvMmIc0znk
	uyR8OTUYbyUtpT2p+3RZ84hUb8hmxh
X-Received: by 2002:a17:903:1b4d:b0:2a9:32c7:92db with SMTP id d9443c01a7336-2a934129193mr45129545ad.61.1770229842449;
        Wed, 04 Feb 2026 10:30:42 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933870b22sm30238005ad.26.2026.02.04.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:30:41 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>
Date: Wed,  4 Feb 2026 18:30:33 +0000
Message-ID: <20260204183033.182747-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DWGAXERRL4OOOA2KAUS7P5MQG7G7YFSS
X-Message-ID-Hash: DWGAXERRL4OOOA2KAUS7P5MQG7G7YFSS
X-Mailman-Approved-At: Wed, 04 Feb 2026 18:38:26 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/4] staging: greybus: fixed styling issue in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DWGAXERRL4OOOA2KAUS7P5MQG7G7YFSS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 3A143EBB6D
X-Rspamd-Action: no action

Fixed a styling issue highlighted by checkpatch.pl.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 07a0e6b63cf3..cf917ddb79c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
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
