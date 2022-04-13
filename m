Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 970DF507B80
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C98B140307
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:55 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	by lists.linaro.org (Postfix) with ESMTPS id B18DD3EC47
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 04:38:58 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id y23so327018qtv.4
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 21:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhTnq07iXAtz0jfkYxAOZJL1OOd02wSKlJiI9TYbfoc=;
        b=AGtVO4+cZMr9M/H/by3ycSQcwTKZGco3sC/YjDjZnVp+eg47fCul7icjFh4ZVaaAjC
         1ksNqXwLJnfRWiQIoJjlV3M9qduhqlvC6Sa1V7yIeUV2RmLitit1jLpBCGvO/we3REs5
         WjqYpiU0lvs5SexnDQWUX/mB6P5PxhUyEzpHr1pVtWAcbOVd+7cpHtLjt7OOSpQLHXzM
         NCCJIazVyd6ClEFTvO8yx/VlUVQ4vWP6HM3S+DeknchS2UA9fXFRSZzCy1Y9/zoUD4TL
         59Eh338+qNlOpv+faTlRG6AkZaThnehaoJV38W6OiNL6co9nUC2g1z1WPId8If9OowQS
         vdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhTnq07iXAtz0jfkYxAOZJL1OOd02wSKlJiI9TYbfoc=;
        b=K3R8dcKnathRce5SoLqHQGWJy/Lutic4KSBxFrsNvYrDjPkNC76gNjb7rmEA96ppdD
         jNhsA/N/cy7G4v/m+cyFeUiEA67jxwvRZPr7X8Gapq89rfKHOjtdtoFLg3xgrLjS7wZS
         48ldv6/smdqAL7q6drIS0UMrxlgAWUEnr6lGwjjUTScMGhGUv8GdqLGAMYrWenYZC2Pj
         UGGcmqAc8f8ipM0n4Lov75eYpIUlyqdZIbsFQ2FgIfQJabkdf+FjyKqeRbda5rQHmAVu
         lFiyjoZLN2Jdg+JrxpB0L5MwuOJ6CxHtLZFgUyPOiGWf6IdOYJtOhZQw4tdLt1v9pv6e
         KoBA==
X-Gm-Message-State: AOAM533fX6I6G7tSdDb+fKQG/EncOI80XJSOUAwXSZEISa29WmgPnK0I
	LAsTSuUn0ptzBfcGHcE9Fbc=
X-Google-Smtp-Source: ABdhPJwo5/CqCf9GrYiQmYkurX8T2Klm+Wgvd1F5+7KxI5Lh1EoSUEBdsH6RMppjEk0+vxFVd1QTvw==
X-Received: by 2002:ac8:5c16:0:b0:2eb:db39:6591 with SMTP id i22-20020ac85c16000000b002ebdb396591mr5807695qti.623.1649824738317;
        Tue, 12 Apr 2022 21:38:58 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id d126-20020a37b484000000b0067e60283d08sm21984056qkf.40.2022.04.12.21.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:38:57 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Wed, 13 Apr 2022 00:38:50 -0400
Message-Id: <cover.1649824370.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZASOJJ67O34NZ5WAS6FIXD33OFLFV5OK
X-Message-ID-Hash: ZASOJJ67O34NZ5WAS6FIXD33OFLFV5OK
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:52 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/2] staging: greybus: fix warnings reported by checkpatch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZASOJJ67O34NZ5WAS6FIXD33OFLFV5OK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first patch corrects a typo in a comment. The second patch removes
an empty callback function.

Changes in version 3:
Edited the second patch in the patchset to remove the entire empty
function with a void return type instead of removing just the return 
statement within the function.

Jaehee Park (2):
  staging: greybus: correct typo in comment
  staging: greybus: remove empty callback function

 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 drivers/staging/greybus/audio_codec.c    | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
