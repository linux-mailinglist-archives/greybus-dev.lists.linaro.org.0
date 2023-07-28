Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 03844767284
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jul 2023 18:56:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABDB744556
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jul 2023 16:56:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 224AE3E94C
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jul 2023 16:56:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=UJp3fgCk;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-686b9964ae2so1690742b3a.3
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jul 2023 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690563400; x=1691168200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhgLEEtGtagrPXkFe05OIkTEXPmgv8eUHXCScdBslN8=;
        b=UJp3fgCkmH5NZHbOaIcmrcXNFbGaCAa80JWGYBuTbfCfhbPCdPo4LNbonLNX5sIy/x
         6YVWrZaZFjbRQWf/+xx2SwvJ9Q9no/lgrbQEnIRj54yzQkxLfbhyMBH4GcrNzy9XljGf
         vYAqRrmxM8wtrt6RVDsm/L5j8CvvLIouFtLJMFQoAm/2kjnnHgsluQFY+zdEW/SoTWZT
         8FI3GNv3YzAEqKFFL6cPBv+6MHO0u8q++h9nGOd9j0mNoN/F4a4BERedDkuRvPiQaAW2
         0BK6rjuLjfBCih7AWUGW7URsxtC7Fs61f13LYXsd9+ip6Tkot6cRdAnuoJGatsnBkF7y
         ScXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690563400; x=1691168200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhgLEEtGtagrPXkFe05OIkTEXPmgv8eUHXCScdBslN8=;
        b=aM4FupfMFC2CYM76jnDNDUtr7jqcMDYdCdH+evQEYKctCbgmfEGL5nH8IZlSwtU3Ct
         fisacv18yJr9q+wf3bNOhmQI+Wj3j4MbSi7E8ExD+d5B8F7H95KMr9kIbB12H2tUREPJ
         sfiqHK6hMq/Hd5Qg77MlhTtLcK2llvBFCXKE0uNusS4J5ZdOaNB2rha77ar+2sheOrMM
         EGYHEJp53hqukHPWqhSE9I5KPJ0TApVjHLelV6wNMD5EZj1amp8EpwMH+KQ0ToanIId5
         3670hGi8iqITijZPbeqDfuYPhNo+Yvv4afa16Yw+KAzkUY94L7b+iCB4vJnJN7B8xERx
         4HjQ==
X-Gm-Message-State: ABy/qLZbqNlFuJxfo3fGLtpM4+nKOGBc8Cyhya3q1wXlFf34y24aDa2C
	5lpCOBHruE917pJD4MNbu36c92y2+Fzq6w==
X-Google-Smtp-Source: APBJJlF4ztPxlJWAQqKO8To6vYxl1mHL3Lu85Kj4AQVH9qB8pWpTfFvIjyMFp/9AoMClWdsX9OrSYg==
X-Received: by 2002:a05:6a00:2382:b0:67a:39c4:5bb5 with SMTP id f2-20020a056a00238200b0067a39c45bb5mr2380971pfc.6.1690563399762;
        Fri, 28 Jul 2023 09:56:39 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.66])
        by smtp.gmail.com with ESMTPSA id k22-20020aa792d6000000b00682a9325ffcsm3430756pfa.5.2023.07.28.09.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 09:56:39 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 28 Jul 2023 22:21:54 +0530
Message-ID: <20230728165155.155332-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 224AE3E94C
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[103.15.228.66:received,209.85.210.177:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: FOCZXNIPSFCGAMG252MFUVQV47ZRPD7Q
X-Message-ID-Hash: FOCZXNIPSFCGAMG252MFUVQV47ZRPD7Q
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/1] First Patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FOCZXNIPSFCGAMG252MFUVQV47ZRPD7Q/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello everyone. This is my first patch to linux kernel. Once I get the
hang of this process, I will be sending patches form GSoC 2023 greybus
driver. Feel free to tell me if I am doing something wrong here

Ayush Singh (1):
  Remove extra newline

 drivers/greybus/es2.c | 1 -
 1 file changed, 1 deletion(-)

-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
