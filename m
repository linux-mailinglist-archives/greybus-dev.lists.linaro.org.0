Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C3398507B7B
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 01282401C0
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:43 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	by lists.linaro.org (Postfix) with ESMTPS id B7ADA3ECE6
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 19:59:22 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id c199so12956842qkg.4
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSSxqX8tPYg/tg3+HY2atLHtEG2+4vSWaPUPQtk8FFs=;
        b=ME2rzraFEBzLQVyEICnGlhLGN3TYXUG40fsZvzk0YNOCUqDi+p+05CekzEMeh8zQJn
         IOe43DpXusxGAK420y04rWTM7YGwlp9Z1NW5W2U5fVSOeG95xLGy0K5CZoXHG2XG5Rrn
         Ci/TmgBDCP6sRQZtWU24HxbQg8FK8axzA8RvRss8FNfKxVojSWHjxNmIxUMZczaEpGjm
         IurY4UMmCo5QwbcVGiI6ZWXP3aOlHNYAXBlAcefoDYaeNeptXyn68wV2oqFAjeeZKBnP
         xpZOAPEeEx5U3NeK0IRuu8hqnfxwXJBRECsvswtiu1V4FZoYbi9y5BTZdgg6OwpKkdsn
         Ltzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSSxqX8tPYg/tg3+HY2atLHtEG2+4vSWaPUPQtk8FFs=;
        b=ZlxaRdDpK/CtaAaQVPjXdfZFSqEIkr+VPuGLlpuLa2Sm0C3QYoq8MMILRDKW8JUOCG
         vameUbCJ2D3mcPrvHF3YwsruGPc4ixfB03iiiHlXd7UWz3cfiIKFSttZrYPci8n5ak48
         720y+AsqrweJvj0VgDW+/3W4UmIOasM1a/1LHJVjrZdtFp21N0EvxYEqPHlq5rV6G6hx
         3r2CN8p5b5rrnrKMhVkxIY874FmY1JfD3wzNc4I7RUJLDGRa57hSkOSxzWo/W+fLcL/l
         1Y1gInTBoqsYBX+f3ywKePJu37PRfnmuk7cXy+h0rTSjVfTeL2sYlcLS7yI+dk/cmwDF
         9rLQ==
X-Gm-Message-State: AOAM533LWiC+1WGRPEcz1CkQvvDJpNpEZb3o5tg+QdxhdOGtJi4v7PBm
	9ZHkcW+cNLnMFkR92AH9mzo=
X-Google-Smtp-Source: ABdhPJzPGA2WvKxT8VEv/QVQmi6hhSwsxGpUOGCJCjo4PLAHqRM02+IDxZUA/gXJEnbYAbOmKtXTVQ==
X-Received: by 2002:a05:620a:4689:b0:67d:4c03:651c with SMTP id bq9-20020a05620a468900b0067d4c03651cmr4343932qkb.475.1649793562350;
        Tue, 12 Apr 2022 12:59:22 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a01c700b002e1b3555c2fsm27270744qtw.26.2022.04.12.12.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:59:21 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Tue, 12 Apr 2022 15:59:13 -0400
Message-Id: <cover.1649793138.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XJNTCHFW6PH264NPZDWL2E65WAPLXNMH
X-Message-ID-Hash: XJNTCHFW6PH264NPZDWL2E65WAPLXNMH
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:39 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/2] staging: greybus: fix warnings reported by checkpatch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XJNTCHFW6PH264NPZDWL2E65WAPLXNMH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first patch corrects a typo in a comment. The second patch removes
an unneeded return.

Changes in version 2:
- edited the subject to be more concise.
- edited the log message to be more descriptive.


Jaehee Park (2):
  staging: greybus: correct typo in comment
  staging: greybus: remove unneeded return

 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 drivers/staging/greybus/audio_codec.c    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
