Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63C86CAD8
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 14:59:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B024744200
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 13:59:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id 2518D400E5
	for <greybus-dev@lists.linaro.org>; Thu, 29 Feb 2024 12:05:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=mrhujIRM;
	spf=pass (lists.linaro.org: domain of colin.i.king@gmail.com designates 209.85.221.50 as permitted sender) smtp.mailfrom=colin.i.king@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e122c8598so198174f8f.1
        for <greybus-dev@lists.linaro.org>; Thu, 29 Feb 2024 04:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709208343; x=1709813143; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKTrC5BUEoERGt6YpPOVR4/EueT/sWktcgEEY9nn3IA=;
        b=mrhujIRMGIDfNVeHhcg9n0AlrTn6TBNWVtnuBCX6orWUFgFgjmtNxHis0jghY4Y9K2
         3J2ojZwG90he6943TdErnS64GpZPARflgjUW+vln/9lsNxZYBmPiFYHy6POweT4LtxVr
         V3QfJszfRL0nmqdk5gMlOrp0nx2quH8LBpgrfoFLOqJVY10D+gqB/PzHEVo7zrX2AmZG
         XrHM2ToHYl9/yTqFAHvKcg/t9so8pU8S7JPIZW5l13GmupNagJry8XYkmjP42FRWSFQc
         pkF/nZWUbx7ySOmgyyqXdLmoPXbIbEkXyuu2XGQh0YRRju+Op4qv3FQJh3lpzCH+mMgB
         jdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208343; x=1709813143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKTrC5BUEoERGt6YpPOVR4/EueT/sWktcgEEY9nn3IA=;
        b=dZPoEDg63NuOVgir6wx3IlPP6Orqht4zVLM+ZqmCNXKI71+eRsLm6r88PCL5gY5l01
         z9RFsSvsNpxfINwJTYFRF0dcLmWpZ8jAuSu4mnbE7F5Eo2YA4sM/DjbA3QfIOWuvwaAe
         Aigwy/ZoHwqiJnr9qXmunOMeKK6rfBg/C/qwVhokzyhujh90Vz2STqudmOFrGov2DkgR
         nmjkagy/leYUMLALWjrLw9ghgSNw/RrLuZkCjrkBImFs25KxKAYpX1UeA/h0pAzfE3uo
         jFR+JaVCx42YxqNVhgbCtMXUbgL8f5rmjpCuiO5JU4Lj23KA4o6C0rWGCFyiLZJvxYOk
         hcHA==
X-Forwarded-Encrypted: i=1; AJvYcCWyzSrlNr+36SovQDWIXhdoxmBfxVcWonOhHQcrh4UvsVuhgQgK4/I/W4/nE5yKv+8yN4nCu90rbCOGKKWZlfNG4Q0z2Q0RAbx8VfTr
X-Gm-Message-State: AOJu0YzXmYVabRTsJoA7hLUT3DGLOG6wlmwh+6UWpn+NGmSJqKcTemyf
	gUfhX4qqXg2PmyheMOO25MxDcDCGokFDAjtVcq6rMOSUsXw5Q5ba
X-Google-Smtp-Source: AGHT+IHflToI7cmVEoLUgAq6Qi4/DXWnunqwZQL/91orV5BJE1B14iuKUeIa2YpviLArwrKjin+VxQ==
X-Received: by 2002:a5d:484a:0:b0:33d:297d:75a9 with SMTP id n10-20020a5d484a000000b0033d297d75a9mr1311981wrs.24.1709208343075;
        Thu, 29 Feb 2024 04:05:43 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id dp14-20020a0560000c8e00b0033d8ce120f2sm1588446wrb.95.2024.02.29.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:05:42 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Thu, 29 Feb 2024 12:05:41 +0000
Message-Id: <20240229120541.219429-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2518D400E5
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-wr1-f50.google.com:rdns,mail-wr1-f50.google.com:helo];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.50:from];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-MailFrom: colin.i.king@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SZWTKUMHCK4OCTFR25OH4OFLBV7562VA
X-Message-ID-Hash: SZWTKUMHCK4OCTFR25OH4OFLBV7562VA
X-Mailman-Approved-At: Thu, 29 Feb 2024 13:59:22 +0000
CC: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH][next] staging: greybus: Remove redundant variable 'mask'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SZWTKUMHCK4OCTFR25OH4OFLBV7562VA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The variable mask is being assigned and bit-set but it is never
being used apart from this. The variable is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/staging/greybus/audio_topology.c:764:15: warning: variable 'mask'
set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 08e6a807c132..5dc4721105d4 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -761,7 +761,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 {
 	int ret, wi, ctl_id;
 	unsigned int val, mux, change;
-	unsigned int mask;
 	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
 	struct gb_audio_ctl_elem_value gbvalue;
@@ -802,7 +801,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 
 	mux = ucontrol->value.enumerated.item[0];
 	val = mux << e->shift_l;
-	mask = e->mask << e->shift_l;
 
 	if (le32_to_cpu(gbvalue.value.enumerated_item[0]) !=
 	    ucontrol->value.enumerated.item[0]) {
@@ -815,7 +813,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 		if (ucontrol->value.enumerated.item[1] > e->items - 1)
 			return -EINVAL;
 		val |= ucontrol->value.enumerated.item[1] << e->shift_r;
-		mask |= e->mask << e->shift_r;
 		if (le32_to_cpu(gbvalue.value.enumerated_item[1]) !=
 		    ucontrol->value.enumerated.item[1]) {
 			change = 1;
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
