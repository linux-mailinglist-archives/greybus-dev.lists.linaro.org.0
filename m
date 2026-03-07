Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PQ0Jx//rWk++gEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 23:58:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B131232975
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 23:58:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8BF583F9B5
	for <lists+greybus-dev@lfdr.de>; Sun,  8 Mar 2026 22:58:38 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by lists.linaro.org (Postfix) with ESMTPS id EC7ED3F827
	for <greybus-dev@lists.linaro.org>; Sat,  7 Mar 2026 14:10:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=e8Om1+th;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2133331b3a.1
        for <greybus-dev@lists.linaro.org>; Sat, 07 Mar 2026 06:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892602; x=1773497402; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czdNAj4K0eRQ1+jtOgU111t/1zRT7GMt/3oVDAa4ZYs=;
        b=e8Om1+th+BnhlFh8JbEuI3QIUfJAZzgWG1yu9CzxaU5DSTJVv53SoIW3r31ivemHzo
         5emp60y98UnNgBxjrviG1aIOImJBJBNY1DBlrLs8hfpQlVm69SCu4fJhVCzEO61AckGz
         iLF1/YNySp+jF3ZuuWyU2c+HOsO3ELrXwjI4XGWi3+cgzJ6AZNmf1LQsGmmjCUZKurcW
         Dva2zO9fnbH033J8dATl4/KY6uxXs4qt9WU9VQDWG576DjE+rdkp99+3HnXzM4jkyd4B
         YV7TznaTmAKurcQuTVPWQ/VY3hprZjX/c42omWrLpDkvlnQiwUSaNUimL2PN/J3q/hVZ
         GmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892602; x=1773497402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czdNAj4K0eRQ1+jtOgU111t/1zRT7GMt/3oVDAa4ZYs=;
        b=cVhcERdV14hAHt9tsPPPCH5LJr9WY2vrKB/nusk1WBcAvkWJ6pFK84eO823iKHvauH
         2v9s2cpQRqnX9mbqotSh+Uf3NdVhWZ4UrEdjgdgvpgdBDR2zRz2DWPkfipxaJ3xW+CQN
         j2q1MEh/LSkJvH9NDEFWUz3xHEHffaepR9pISkBfpe7zCUFc80I5Zxz7A5TX+UD+Xqcu
         lLLJkiFgp6HUciJtvRSHSYNFuGI8OFt702MPcKO2hBebMjnSnSUlhK7XgqdG2ZqonYBo
         OM/Yuq/IPGs8AydNBPInnxBpsbU2V9Ym9pRfGNW/zZ0IePw5TbCOuiZmM1HwoMOaUtse
         7WMg==
X-Forwarded-Encrypted: i=1; AJvYcCVQdIYsAe27TN06OORk1+96T5gugw5eNEGS1WSWqaITcpXvc5ZcuDLlCBh/v3fnTBwZpbAdoGkxG7EbJw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzLEd0ET313Q6q5WjyWDcvI18dpKdc2Of4ulWLcxItQhxHeU7gh
	NfVpiNrtGI3E/urXIKHJoKZPX/aslxJbPn20/oXz84KJ5AqDn5nAf6+X
X-Gm-Gg: ATEYQzzBEOebyzCfa6z2xbOAKnmhb0wHxLIhl/MMzF2LQD77Gi+SjZv9wnaamYHEwER
	Q/bc9ntzzmUwmDGQE8zCR3ZlkoYt7sxpUpP7QeRdXEPrFwf2LZ8ksJKLU72WF/Bkn2Kc0WHLkxk
	/Wr7WvEroAE5OGkAiEvoCVN14C7w0qEu1OoFD+AgZ1CV43kUZdKX6fduVKThjPMYpQjTcY6/NxU
	43p60mxeuSuP23hu6UF60j2DEKQ9PV7i8PdYaiAIrG6InZO4luJb7uEsNzqT6g0n+6OfCbVT3tq
	QtjMAyINT1VexZkTm4TuCVQe1hVnOKVjI4ZZZBRoqIK/TDoZbltPii8HBZinpEEpgqUkEc0foNm
	JUIJbAYCjFwujswQ9Q8aZEhfqVOQZjSNvGTdbAScco/Ps9nD/Z/zgF2ugrMCMK6KpgQdUxNadkE
	eN+IqE0aQWbXZWJjm6V4EJJkzOvCFkOUUP2mdqXiPWko4khp+C0G1kDhCkXubyGPZsjQYK0QABh
	nYYfIbYCQeIghWz2G6n/AiiO0I5ML6HDgU=
X-Received: by 2002:a05:6a00:cd0:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-829a2db98d7mr5454772b3a.1.1772892602081;
        Sat, 07 Mar 2026 06:10:02 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm4784965b3a.29.2026.03.07.06.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:10:01 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Date: Sat,  7 Mar 2026 14:09:24 +0000
Message-ID: <20260307140930.1732-2-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307140930.1732-1-rchtdhr@gmail.com>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CPTHQRACVTME5TVEVLYSIYLAMGOY4ICU
X-Message-ID-Hash: CPTHQRACVTME5TVEVLYSIYLAMGOY4ICU
X-Mailman-Approved-At: Sun, 08 Mar 2026 22:58:33 +0000
CC: Rachit Dhar <rchtdhr@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 1/2] staging: greybus: fixed styling issue in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CPTHQRACVTME5TVEVLYSIYLAMGOY4ICU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7B131232975
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[32];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.682];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

Fixed a styling issue highlighted by checkpatch.pl, that was occurring due to improper alignment of function parameters.

CHECK: Alignment should match open parenthesis
+               ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
+                               intf_load.load_method, intf_load.firmware_tag);

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..e20e9136c106 100644
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
