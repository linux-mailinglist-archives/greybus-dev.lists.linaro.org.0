Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC3399A6A
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F819612A6
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 08CB060B0A; Thu,  3 Jun 2021 06:03:16 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CCEF260D42;
	Thu,  3 Jun 2021 06:03:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 77CE461117
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 13:42:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6C0A261146; Wed, 19 May 2021 13:42:51 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by lists.linaro.org (Postfix) with ESMTPS id 640C561117
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 13:42:49 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 27so8177550pgy.3
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVZkSQGihBwShgl8HOq8FcajrTqG1qrxRHeRqHbeMSU=;
 b=SLKlqLGMLkBhmW5gMF03+rdrAx0M3nrAGIRv/iBBkmdArqbh+McSLRGuGrb5vwrp31
 DWtSZA0zNXOBWHGYNfwQHyB0JEkbngSqKKeYfq3TEDsIFz78qGMuixk+kXt9Ss6AXAkP
 MjNo4Ty1Ki7m2ZoHxqYRPy6KDSKZ7Ro6Lz5ij14jDJGlzYv99zQT0kQdkxHG+cmBh8Xy
 lnx3S1cKHRmRcGojDQNaNUthJfoQEEbltH5Hnv6nBSCfScULeOsgw6yMR5CGjLIl6qPc
 oSGhvgPYUblYr03G+Cj+tBs3lBJtCmFgGdo7Ic6Uu3P8vyo8s8TS+Id7xnhdXknkfmDD
 5G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVZkSQGihBwShgl8HOq8FcajrTqG1qrxRHeRqHbeMSU=;
 b=bANw8qQK2Ug22GcnWsAHU0Q2rHcNQUc1vEWkowavL3MYVqDCxLPP9jXRCwiYsJJxA5
 yEUApEo0AqyMKOOJJPkqYZsUYvl4Bz4+vqwxrVQoJOmfQfs3G926qujqC5D41c4efYes
 mClLP6yZzvdpHIACJvoPML8y0SBQYCBjId7TdIcxHhMDQhjW0h7m8PzCYkNjZ+C8n/Wf
 mjdOhhqWOGf2uda+UsHZ0D3HpcmiBDq5w+aFLwe9wUK3DnhYqSFoPLymAs52YEOHAbZ5
 fwgAACrEavCBkqUqeNoP1v3DuBcFQ9vVftRlDILcCHpW11KkFjhfKeygJWuh7Q2kWRCW
 X3bA==
X-Gm-Message-State: AOAM533taYM0iyH1ZlqMTUxVcdXctzEwPNqzWNmYLVemwokrGfOR7cy5
 0/71LVYa/KQiXdaBa24l55Y=
X-Google-Smtp-Source: ABdhPJyyYycNawXUBSpqS2VP+cIaEk/TWkpmsGe8wDcN4X2qrAOe1ATcX3vn37nW8DMtlfhyOJjk0g==
X-Received: by 2002:a65:640c:: with SMTP id a12mr10973519pgv.229.1621431768522; 
 Wed, 19 May 2021 06:42:48 -0700 (PDT)
Received: from novachrono.domain.name ([106.214.255.120])
 by smtp.gmail.com with ESMTPSA id q24sm15470387pgk.32.2021.05.19.06.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 06:42:47 -0700 (PDT)
From: Rajat Asthana <thisisrast7@gmail.com>
To: dan.carpenter@oracle.com
Date: Wed, 19 May 2021 19:11:19 +0530
Message-Id: <20210519134119.848055-1-thisisrast7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519102947.GU1955@kadam>
References: <20210519102947.GU1955@kadam>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH v2] greybus: audio: Fix sparse warning.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: elder@kernel.org, linux-staging@lists.linux.dev, johan@kernel.org,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 Rajat Asthana <thisisrast7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Sparse complains that:
   warning: restricted send_ctl_elem_iface_t degrades to integer.

I have looked at this code, and the code is fine as-is. Normally we
would frown on using the __force directive to silence Sparse warnings
but in this case it's fine. Case statements can't be made into __bitwise
types. We also can't change the type of "ctl->iface" either because that
is part of the user space API.

So just add a (__force int) to make the warning go away.

Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
---
Changes in v2:
    - Update the commit message.

 drivers/staging/greybus/audio_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 1fc7727ab7be..1e613d42d823 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -676,7 +676,7 @@ static int gbaudio_tplg_create_kcontrol(struct gbaudio_module_info *gb,
 	struct gbaudio_ctl_pvt *ctldata;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_kctl(gb, kctl, ctl);
@@ -903,7 +903,7 @@ static int gbaudio_tplg_create_wcontrol(struct gbaudio_module_info *gb,
 	int ret;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_ctl(gb, kctl, ctl);
-- 
2.31.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
