Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EFEC28907
	for <lists+greybus-dev@lfdr.de>; Sun, 02 Nov 2025 02:20:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5092B3F820
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Nov 2025 01:20:49 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	by lists.linaro.org (Postfix) with ESMTPS id 81FB33F7E8
	for <greybus-dev@lists.linaro.org>; Sat,  1 Nov 2025 07:46:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=eRcuIcdX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vacacax16@gmail.com designates 209.85.167.49 as permitted sender) smtp.mailfrom=vacacax16@gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so4027300e87.1
        for <greybus-dev@lists.linaro.org>; Sat, 01 Nov 2025 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761983207; x=1762588007; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=eRcuIcdXdJ7nlsUEiLEQIlaGBMNnPMe62xC+eARFLaa5K4Is4y00Uicvi1NmrkSBvm
         5FjVoUGWbReRao61NiBPCt4/YdkkCu8AOvxwB4hu6TvgrrwrwtBBOKW64FezrQME8v0s
         hqMle07oGDkdJxE1ubq+iSpgP/TyHGMimjcU/D9T/217g3k0GerYVfxqQ9QQSE5auGxO
         pKs4o3xRDRbnGh/t/JhHO4sYt9HDVQ4Xi4MLVjqfr9gUa2nkD7BnsdkvoPAAX6gfpU38
         z88I7YnRppm+At3Jt6Hpx6qUohcreznjtnnUkCsYsBLrqvuERsQlJ5wX8gEKWQ84T3r5
         6MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761983207; x=1762588007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=Rlnl4NXQdtoM9Js4sPxV2L/iODUUrATfrgWGwQnTQLnMw5Nhu7SyysmFLmEJNYMNZN
         g/rw4XpWen+gVKnqBsau3rugIU1Xcyv5qYiLzkt6ban3IMGszTSzfTRfeyfFSo3BgLFr
         LIXboFIE9VK7dkoIiKBna/KhsBIjwIAXa4AxWcYMM7YN8+jN8vW/HFUc04ceyYNm22yr
         FU6sGa4eAnACaqaPt1dwvr285PHWwCnX1JfCzLTsPoAvFblZV84leEBlAGNWkOtL1gWu
         NvcqObfVeaKV/xv8DUMDBti3wiH3ZkiQ9IoWxKHwSJRvdTEPbL+ya5YD4qx3IcQBw7A0
         WUQw==
X-Gm-Message-State: AOJu0YwbT+yPwEd6NZtDacp9xpm2KlRI3xAZxDwpYrfX10zhswhd2DV+
	w6JbTjIf18E0hqmLhdjEztYZrnfz7ORj3EEq+bHFHCFYGhnlZhs9isUd
X-Gm-Gg: ASbGncuwRR7hBpovWDVdMj59dFxSLtuzNATuIDwoUTeJ2TKh+IlnRKFaODsJKY1wXHr
	H9yznYtaSimLwoHk3eAeJNql9S4hpb+8MNNLthMR+Oo19mTefZkNUG6R+R61lgPnCzURWHGehoV
	1eoQCD+5YIsYacnAKh7JXO6w/nxM1aoGaLC6K1p3S9kUCofH5NuqRYO80KlGpW2JZbn7QztfGbL
	1l+lIPFkEbvULAZsQ4Qm6QWpzbmQc48l9ZlyNLnPo0YBbuPCNrynJfBJSHN53ZQ3padj7Pz0UiO
	uUQkII7mUf48pcvqjGWbNRyWk1+2z+4bvI9IECC8KE4zxklxwwoxt17EwAjxVgXSVKtTYjMwyiL
	ayyfWAsGiHOXSYL1IPzClHbGhJqI34SzlZZUCQKvoT1eF4RNaOnR3z15nQ567QydRlK2P4Lo0j5
	Afzu5JmHDRYNE7zQ==
X-Google-Smtp-Source: AGHT+IHymJOP85Ntx/hZkcSgPuiaTMncBc5HzJI10xt4SlURooyxsUYKP8HyGqOGX3S39upKyzjXcw==
X-Received: by 2002:a05:6512:1149:b0:593:6b:520c with SMTP id 2adb3069b0e04-5941d36e428mr2100693e87.10.1761983206760;
        Sat, 01 Nov 2025 00:46:46 -0700 (PDT)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5c2782sm1027604e87.107.2025.11.01.00.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 00:46:45 -0700 (PDT)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  1 Nov 2025 10:46:16 +0300
Message-ID: <20251101074616.11211-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 81FB33F7E8
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.49:from];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: vacacax16@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5TAYRUR6O7QCTHGYYNMCP52UJMLLJWET
X-Message-ID-Hash: 5TAYRUR6O7QCTHGYYNMCP52UJMLLJWET
X-Mailman-Approved-At: Sun, 02 Nov 2025 01:20:39 +0000
CC: greybus-dev@lists.linaro.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5TAYRUR6O7QCTHGYYNMCP52UJMLLJWET/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
---
 .../staging/greybus/Documentation/firmware/firmware-management  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware-management b/drivers/staging/greybus/Documentation/firmware/firmware-management
index 7918257e5..393455557 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware-management
+++ b/drivers/staging/greybus/Documentation/firmware/firmware-management
@@ -193,7 +193,7 @@ Identifying the Character Device
 
 There can be multiple devices present in /dev/ directory with name
 gb-authenticate-N and user first needs to identify the character device used for
-authentication a of particular interface.
+authentication of a particular interface.
 
 The Authentication core creates a device of class 'gb_authenticate', which shall
 be used by the user to identify the right character device for it. The class
-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
