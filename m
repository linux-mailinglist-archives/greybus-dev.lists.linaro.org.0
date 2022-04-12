Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 51863507B78
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 83FCD402E6
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:35 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	by lists.linaro.org (Postfix) with ESMTPS id 108D83EC22
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 01:50:28 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id s6so3581695qta.1
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 18:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKyWVi0ve7aKsv/+aHfSEOINGe3jcF/vd8+tINhOMZE=;
        b=QSsOvOnZkV+2M7zbq6OC+bRcWNQYZT2UUt8v3cmf02LOAKcNqBgAxrIRUNKeSEEAoJ
         +wkEwO9wPlI6eJxxuzjKsaFYJtRrc99bkvNGGomxrGn4UoUTUCULgo/AGkPjjEXYDJoE
         EcBxoVBW5evfOEk/RGaPLtfxvAoRKdrq/3EpLOO8ukA6LEJJHuvUZEQRm+mlOEQeXCQD
         iK3mNjqrLYLOwOQCTNvnpfOhC9kMF6+XutcRcTY/YfWwJk4KxB6aZj0cvPLpKu+sUIdR
         Vz6j70xm/ZSrtGbR13um/c81eKjYHWveTjTATbAfg5/4lj75Oqwztj8PKRB5V1kZVfHZ
         28Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKyWVi0ve7aKsv/+aHfSEOINGe3jcF/vd8+tINhOMZE=;
        b=zTkzFGIEdAA1kW4DdRflNr3R78OEotOrqzVYOYJudGal/sv5KWx4j/ASxT4n8E0I1D
         +t225t5idrBRRp2c6ke+KpI8oALuYS2Fn26j7NsBmQ8V0Hy+dlxjW2FAuJqG/VmQK809
         e4WqTAdwfotnbJ8OMdt1ic5+tMkN+kBnw/iYmIl60sFbc9aO/aQ7IrBeD2ss7tnEXLNE
         MLzVmlOG+vXWMtbKcfxqV7HrnDfACe2OF1pryiFpAX9Y3AVcPVcUnbnwqnQBLwZPssgK
         WImGwUmK1mdgDMnwf03Vpdb8H03fohfFQZ0F9epmOkuNmHuyK0GedcfquckjS8UMTU57
         CqkA==
X-Gm-Message-State: AOAM5321GgDypckHhlOqcT3D+v8KxQiNOeLbQuNoip0EkE+4MERH8zUL
	lHiTBKjH4a0lUC6XuATZH3E=
X-Google-Smtp-Source: ABdhPJyEBMG97k4uEqBba5YXTdlj8fzZQ3go4vS1Au7uKyxdEVudkrcxMTbLa+Z0kDXvPaie3BSAfQ==
X-Received: by 2002:a05:622a:4014:b0:2ed:eb1:e12 with SMTP id cf20-20020a05622a401400b002ed0eb10e12mr1643843qtb.421.1649728227741;
        Mon, 11 Apr 2022 18:50:27 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm29556305qta.75.2022.04.11.18.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:50:27 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Mon, 11 Apr 2022 21:50:20 -0400
Message-Id: <cover.1649712572.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KCR74LIUYO4FVDETUPW7WT5UPR4N7KAV
X-Message-ID-Hash: KCR74LIUYO4FVDETUPW7WT5UPR4N7KAV
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:32 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging: greybus: fix warnings reported by checkpatch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KCR74LIUYO4FVDETUPW7WT5UPR4N7KAV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first patch corrects a typo in a comment. The second patch fixes 
'void function return statements are not generally useful' warning.

Jaehee Park (2):
  staging: greybus: correct typo in comment 'Atleast' to 'At least'
  staging: greybus: remove return in an empty void function

 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 drivers/staging/greybus/audio_codec.c    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
