Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MruLKrc0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9439A913
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6340F40484
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	by lists.linaro.org (Postfix) with ESMTPS id E39533F748
	for <greybus-dev@lists.linaro.org>; Sat,  4 Apr 2026 01:00:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lufbdUpa;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.210.179 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1719141b3a.1
        for <greybus-dev@lists.linaro.org>; Fri, 03 Apr 2026 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775264405; x=1775869205; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdu78WEBDthjS8bCUBN2NaYBaupX0mXYCBE2SceYhTE=;
        b=lufbdUpaMnP602/4c69yhIiux3sgaWRRiMPtjtsEFt4ukUzL6j/vdBws3E0Nta4dbx
         xyEiY3RH5zxNMZaytYksuaJ0lnFgRRnYDKIZe0czEWeIc2tJNuE8RSz0e8fE0258Ognw
         oVSJNXbxaoe2lBqy4atanVXWj+/5VC6h3No5Yy/CF8jhZ5m1Kp/HvO7f7rNaFD8M8mQY
         EIsUsrJpfuyHhKca3R3YQSihfJ5KVm7Ld5juz1I+IpE1yLmt7Fjf5z7jQ+IN8OlBFUeR
         Gds0KHEQb0N89D1ekLYEEuUI+EbUmAlG+Fr4MdN53+LQODFbgxqjuEUCoXs27faLymxu
         PhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775264405; x=1775869205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pdu78WEBDthjS8bCUBN2NaYBaupX0mXYCBE2SceYhTE=;
        b=GmwacLmlZ0AErE6VgsE0qK0yU6ltmESJABF0hiub0jy6YS2UktwqQHy5AxIJ5JyMBC
         LkSnybimZC48oy5Ee1RI8DvFxCwp58MEo+j7LyoEzpzLrhpi6JJH1rwyW3wPosLdHG3u
         aXH9qV53hhGEypAMCdyCL8aBIgq8ALryRh8zPAw9c8yYB5UBMscPxu3aBKdVdUpqdlcs
         k0U3yyYF/8bl0GnJmHbWzZxFQnYTuOhMRK7AWAE0GZfR8g9Fc4xNzfQxIQYmdU5J9axB
         JjyDfEFVQLIRNtkyLB21phtf6nyUqVTqbzTXZVd7YMlB93jAz5XDjloeoNxXq9tNkvaJ
         LOsg==
X-Gm-Message-State: AOJu0Yx+dazT+CvA91vbeZ/u2hQ03INw/aAUQ59OmKXFU2zif9PfYf5i
	zXgroKSzZtQpMqntYP601tyh7GRzSSpndua6Dli0IW+74xG2gZnNNpNu
X-Gm-Gg: AeBDievTAakBSlDQYcPhaJn7Xs0luKb1GNfYUbyFcJqb2/uVLIH+XHMAwb7GspD8AFj
	EZnI33k1YV3GJwOet5pZa1NXLpWvZdKJ3Ftp6vO8xfFn61jR3k1CJrzFCvgcn+ThPlPK46h+SUq
	loj93zIghFkOLAjZ+9U0ahTsL+V7kA2E4gKFvRMUPXS7wMcsnBw/nWiv4KZMA6a1t9999C7HlEb
	uYqW3BqzdOlHSCFysk+LqPDsd/DaMoBXuil2ihI59pPw5yGSl3f3cU8OZlcGg6343oe+kP066da
	ecm1TMkvoDVr1/63V9fyU6a0ESC94yDSDcaYlkHy6XYZHRjWKApkvuCdnH4OJuYCh6gclFionkk
	ai3E9Tdmt58MiG9IgnpISpXytfWQczVmElb6Xso76G7QcGch62YiXq1ZIULPUGvYBbnTnANKiv+
	i3xH8pAuKEAKwV3lK3IHUMTaFhyfpmHX6Ly/UGHGzcJg+Ql9KCM16vOQTbYMRgKlJPxw4sAGJdM
	rQ=
X-Received: by 2002:a05:6a00:4b53:b0:827:3222:c4c with SMTP id d2e1a72fcca58-82d0dba3201mr4297536b3a.39.1775264405006;
        Fri, 03 Apr 2026 18:00:05 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:7de6:bf03:20c5:a0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3aaeesm7565306b3a.13.2026.04.03.18.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:00:04 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Sat,  4 Apr 2026 09:59:37 +0900
Message-ID: <20260404005939.116701-2-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404005939.116701-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260404005939.116701-1-k.souta0926@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Q2HWUSGT3D4ZAUPWVR75AAERCUE3K223
X-Message-ID-Hash: Q2HWUSGT3D4ZAUPWVR75AAERCUE3K223
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:36 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] staging: greybus: fix unsigned long long type warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q2HWUSGT3D4ZAUPWVR75AAERCUE3K223/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.042];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 58D9439A913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the checkpatch.pl warning "Prefer 'unsigned long long' over
'unsigned long long int'". This cleans up the code style in
authenticate.c.

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138a5..0ef88b7d24de02 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
